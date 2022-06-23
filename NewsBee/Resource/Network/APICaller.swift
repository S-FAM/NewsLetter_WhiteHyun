//
//  APICaller.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/16.
//

import Foundation

/// 네이버 뉴스 API를 가져올 때 사용합니다.
struct APICaller: SocketConnection {
  
  /// 뉴스를 가져옵니다.
  func getNaverNews(header: APINewsURI, completion: @escaping (Result<ResponseNews, APIError>) -> Void) {
    
    guard let percentString = header.percentQuery,
          let url = URL(string: "\(APIConstants.naverNewsBaseURL)?query=\(percentString)&display=\(header.display)&start=\(header.start)&sort=sim")
    else {
      completion(.failure(.responseError))
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.addValue(APIConstants.naverClientID, forHTTPHeaderField: "X-Naver-Client-Id")
    urlRequest.addValue(APIConstants.naverClientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
    
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      
      guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200,
            let data = data
      else {
        completion(.failure(.responseError)) // 응답 에러
        return
      }
      
      do {
        let responseNews = try JSONDecoder().decode(ResponseNews.self, from: data)
        completion(.success(responseNews))
      } catch {
        completion(.failure(.decodingError)) // catch 문에 따른 디코딩 에러
      }
    }
    
    task.resume()
  }
  
  func serverNews(header: ServerNewsHeader, completion: @escaping (Result<[ServerNewsInfo], APIError>) -> Void) {
    guard let percentString = header.percentQuery,
          let url = URL(string: "http://\(hostAddress):\(port)/\(percentString)")
    else {
      completion(.failure(.responseError))
      return
    }
    
    var urlRequest = URLRequest(url: url)
    urlRequest.addValue(String(header.startIndex), forHTTPHeaderField: "startIndex")
    urlRequest.addValue(String(header.count), forHTTPHeaderField: "count")
    
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
      
      guard let httpResponse = response as? HTTPURLResponse,
            httpResponse.statusCode == 200,
            let data = data
      else {
        completion(.failure(.responseError))
        return
      }
      
      do {
        let results = try JSONDecoder().decode([ServerNewsInfo].self, from: data)
        completion(.success(results))
      
      } catch {
        completion(.failure(.decodingError))
      }
    }
    
    task.resume()
  }
}

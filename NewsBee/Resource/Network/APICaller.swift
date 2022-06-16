//
//  APICaller.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/16.
//

import Foundation

/// 네이버 뉴
struct APICaller {
  
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
        print(responseNews)
        
      } catch {
        completion(.failure(.decodingError)) // catch 문에 따른 디코딩 에러
      }
    }
    
    task.resume()
  }
  
  
}

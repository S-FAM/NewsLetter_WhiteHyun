//
//  NewsInfo.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/16.
//

import Foundation


struct ResponseNews: Codable {
  let items: [NewsInfo]
}

struct NewsInfo: Codable {
  
  /// 뉴스 제목
  let title: String
  
  /// 뉴스의 내용 요약
  let description: String
  
  /// 네이버 하이퍼텍스트 link
  let link: String
  
  /// 언론사 하이퍼텍스트 link
  let originalLink: String
  
  /// 뉴스 출판 시간
  let publishDate: String
  
  
  enum CodingKeys: String, CodingKey {
    
    case title
    case description
    case link
    case originalLink = "originallink"
    case publishDate = "pubDate"
  }
  
}

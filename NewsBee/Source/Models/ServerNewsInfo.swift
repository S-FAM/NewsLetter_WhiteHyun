//
//  ServerNewsInfo.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/23.
//

import Foundation


struct ServerNewsInfo: Codable {
  
  /// 뉴스 제목
  let title: String
  
  /// 뉴스의 내용 요약
  let description: String
  
  /// 뉴스 이미지
  let imageLink: String?
  
  /// 언론사 하이퍼텍스트 link
  let url: String
  
  /// 뉴스 출판 시간
  let publishDate: String
  
  
  enum CodingKeys: String, CodingKey {
    
    case title
    case description
    case url
    case imageLink = "image"
    case publishDate = "date"
  }
  
}

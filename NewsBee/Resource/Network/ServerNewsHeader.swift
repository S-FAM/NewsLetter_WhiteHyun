//
//  ServerNewsHeader.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/23.
//

import Foundation


/// 서버 뉴스 api에 대해 요청할 파라미터를 가집니다.
struct ServerNewsHeader {
  
  /// 검색 쿼리
  private let category: String
  
  /// 검색 결과 출력 건수 지정
  let count: Int
  
  /// 검색 시작 위치
  let startIndex: Int
  
  
  /// 검색 쿼리를 url의 문자로 표현하는 쿼리문
  var percentQuery: String? {
    category.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
  }
  
  init(category: String, count: Int = 10, startIndex: Int = 1) {
    self.category = category
    self.count = count
    self.startIndex = startIndex
  }
  
}

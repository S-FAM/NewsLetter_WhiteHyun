//
//  APIURI.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/16.
//

import Foundation

/// 네이버 뉴스 api에 대해 요청할 파라미터를 가집니다.
struct APINewsURI {
  
  /// 검색 쿼리
  private let query: String
  
  /// 검색 결과 출력 건수 지정, 최대 100
  let display: Int
  
  /// 검색 시작 위치, 최대 1000까지 가능
  let start: Int
  
  
  /// 검색 쿼리를 url의 문자로 표현하는 쿼리문
  var percentQuery: String? {
    query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
  }
  
  init(query: String, display: Int = 10, start: Int = 1) {
    self.query = query
    self.display = display
    self.start = start
  }
  
}

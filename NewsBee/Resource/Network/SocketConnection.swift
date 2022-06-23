//
//  SocketConnection.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/23.
//

import Foundation

protocol SocketConnection {
  var port: Int { get }
  var hostAddress: String { get }
  
  func connect(
    _ category: String,
    startIndex: Int,
    count: Int,
    completion: (Result<[MyNewsInfo], Error>) -> Void
  )
}

extension SocketConnection {
  var port: Int {
    return 9999
  }
  
  var hostAddress: String {
    return "localhost"
  }
}

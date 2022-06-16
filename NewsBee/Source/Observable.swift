//
//  Observable.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/16.
//

class Observable<T> {
  
  var value: T? {
    didSet {
      listener?(value)
    }
  }
  
  init(_ value: T?) {
    self.value = value
  }
  
  private var listener: ((T?) -> Void)?
  
  func bind(_ listener: @escaping (T?) -> Void) {
    listener(value)
    self.listener = listener
  }
}

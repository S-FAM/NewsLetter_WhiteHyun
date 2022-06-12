//
//  NewsViewController.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/10.
//

import UIKit

class NewsViewController: UIViewController {
  
  let label = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(label)
    label.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate(
      [
        label.widthAnchor.constraint(equalToConstant: 50),
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      ]
    )
  }
  
  
}

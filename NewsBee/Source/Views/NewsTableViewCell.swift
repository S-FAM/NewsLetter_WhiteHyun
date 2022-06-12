//
//  NewsTableViewCell.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/12.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
  
  static let identifier = "NewsTableViewCell"
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

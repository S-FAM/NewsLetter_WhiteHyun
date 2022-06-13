//
//  NewsHeaderView.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/13.
//

import UIKit

class NewsHeaderView: UIView {
  
  private let newsImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.image = UIImage(named: "mainIcon")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private let newsTitle: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.text = "OQIIGJAOEIGJOAEGJOAIEJGOIAEJGOAIEJG"
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let newsDescription: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.text = "AEIGJAOEGJAEOIGJAEOGJOAEGJOIAGJJGEJGIAOJGIOEJGOAEIJGOAJGOAE"
    label.font = .systemFont(ofSize: 15, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = 15
    stackView.distribution = .fill
    stackView.axis = .vertical
    stackView.alignment = .fill
    return stackView
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    [newsImageView, newsTitle, newsDescription].forEach {
      stackView.addArrangedSubview($0)
    }
    
    addSubview(stackView)
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func setupConstraints() {
    
    
    NSLayoutConstraint.activate(
      [
        stackView.topAnchor.constraint(equalTo: topAnchor),
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
      ]
    )
    
    NSLayoutConstraint.activate(
      [
        newsImageView.heightAnchor.constraint(equalToConstant: 227)
      ]
    )    
  }
}

//
//  NewsTableViewCell.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/12.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
  
  static let identifier = "NewsTableViewCell"
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 15, weight: .regular)
    label.numberOfLines = 2
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var newsImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.image = UIImage(named: "mainIcon")
    imageView.layer.cornerRadius = 15
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  private lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 11, weight: .regular)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLayouts()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func setupLayouts() {
    [titleLabel, descriptionLabel, timeLabel, newsImageView].forEach {
      addSubview($0)
    }
  }
  
  
  private func setupConstraints() {
    
    NSLayoutConstraint.activate(
      [
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
      ]
    )
    
    NSLayoutConstraint.activate(
      [
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
        descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
      ]
    )
    
    NSLayoutConstraint.activate(
      [
        newsImageView.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 15),
        newsImageView.widthAnchor.constraint(equalToConstant: 70),
        newsImageView.heightAnchor.constraint(equalToConstant: 70),
        newsImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
      ]
    )
    
    NSLayoutConstraint.activate(
      [
        timeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 24),
        timeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19)
      ]
    )
  }
  
  
  func configure(with model: NewsTableViewCellViewModel) {
    titleLabel.text = model.title
    descriptionLabel.text = model.description
    timeLabel.text = model.publishDate
    newsImageView.image = model.image
  }
  
  
}

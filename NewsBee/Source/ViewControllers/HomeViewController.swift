//
//  HomeViewController.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/08.
//

import UIKit

class HomeViewController: UIViewController {
  
  
  /// 상단에 보이는 뉴스비 아이콘 이미지입니다.
  private let iconImageView: UIImageView = {
    let image = UIImage(named: "mainIcon")
    let imageView = UIImageView(image: image)
    imageView.tintColor = .label
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    setupLayouts()
    setupConstraints()
  }
  
  func setupLayouts() {
    view.addSubview(iconImageView)
  }
  
  func setupConstraints() {

    
    // MARK: IconImage
    NSLayoutConstraint.activate(
      [
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        iconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        iconImageView.widthAnchor.constraint(equalToConstant: 80),
        iconImageView.heightAnchor.constraint(equalToConstant: 80)
      ]
    )
  }
}

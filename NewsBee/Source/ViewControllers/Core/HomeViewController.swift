//
//  HomeViewController.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/08.
//

import UIKit

class HomeViewController: UIViewController {
  
  
  let categories: [String] = ["business", "entertainment", "health", "science", "sports", "technology"]
  
  /// 상단에 보이는 뉴스비 아이콘 이미지입니다.
  private let iconImageView: UIImageView = {
    let image = UIImage(named: "mainIcon")
    let imageView = UIImageView(image: image)
    imageView.tintColor = .label
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  /// 서브카테고리를 보여주는 컬렉션뷰입니다.
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumLineSpacing = 20                  // item마다 20의 공간을 둚
    layout.scrollDirection = .horizontal            // 수평 스크롤
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.showsHorizontalScrollIndicator = false // 스크롤 인디케이터 제거
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(
      CategoryCollectionViewCell.self,
      forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier
    )
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    setupLayouts()
    setupConstraints()
  }
  
  
  /// ViewController 내부에 보이는 View를 추가합니다.
  private func setupLayouts() {
    view.addSubview(iconImageView)
    view.addSubview(collectionView)
  }
  
  /// 추가한 View의 제약조건을 설정합니다.
  private func setupConstraints() {
    
    // MARK: IconImage
    NSLayoutConstraint.activate(
      [
        iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        iconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        iconImageView.widthAnchor.constraint(equalToConstant: 80),
        iconImageView.heightAnchor.constraint(equalToConstant: 80)
      ]
    )
    
    // MARK: CollectionView
    NSLayoutConstraint.activate(
      [
        collectionView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 7),
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        collectionView.heightAnchor.constraint(equalToConstant: 20)
      ]
    )
  }
}


// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categories.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: CategoryCollectionViewCell.identifier,
      for: indexPath
    ) as? CategoryCollectionViewCell
    else {
      return UICollectionViewCell()
    }
    
    cell.configure(with: categories[indexPath.row])
    
    return cell
  }
}


// MARK: - UICollectionViewDelegate

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  // 셀의 item별 크기 설정
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let size = CGSize(width: categories[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]).width + 25, height: 20)
    return size
  }
}

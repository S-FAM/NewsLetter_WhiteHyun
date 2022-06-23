//
//  HomeViewController.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/08.
//

import UIKit

class HomeViewController: UIViewController {
  
  
  let categories: [String] = ["정치", "경제", "사회", "생활|문화", "세계", "IT|과학"]
  
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
  
  private let dividingLine: UIView = {
    let stroke = UIView()
    stroke.layer.borderWidth = 1
    stroke.layer.borderColor = UIColor(red: 0.969, green: 0.969, blue: 0.969, alpha: 1).cgColor
    stroke.translatesAutoresizingMaskIntoConstraints = false
    return stroke
  }()
  
  /// 서브카테고리에 따른 뉴스 뷰 컨트롤러의 컨테이너 역할을 담당합니다.
  private lazy var pageViewController: UIPageViewController = {
    let pageVC = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    pageVC.setViewControllers([dataViewControllers[0]], direction: .forward, animated: true)
    pageVC.delegate = self
    pageVC.dataSource = self
    pageVC.view.translatesAutoresizingMaskIntoConstraints = false
    return pageVC
  }()
  
  /// 카테고리별 뉴스 뷰 컨트롤러를 갖고 있습니다.
  private lazy var dataViewControllers: [UIViewController] = {
    var vcs: [NewsViewController] = []
    categories.forEach {
      let vc = NewsViewController()
      vc.category = $0
      vcs.append(vc)
    }
    return vcs
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
    view.addSubview(dividingLine)
    view.addSubview(pageViewController.view)
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
    
    // MARK: - Dividing lines
    NSLayoutConstraint.activate(
      [
        dividingLine.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        dividingLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        dividingLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        dividingLine.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 15),
        dividingLine.heightAnchor.constraint(equalToConstant: 1)
      ]
    )
    
    // MARK: PageViewController
    NSLayoutConstraint.activate(
      [
        pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        pageViewController.view.topAnchor.constraint(equalTo: dividingLine.bottomAnchor, constant: 15),
        pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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

extension HomeViewController: UICollectionViewDelegateFlowLayout {
  
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


// MARK: - UIPageViewControllerDataSource

extension HomeViewController: UIPageViewControllerDataSource {
  
  // 페이지를 왼쪽으로 넘기는 경우 어떤 view controller를 보여줄 것인가?
  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerBefore viewController: UIViewController
  ) -> UIViewController? {
    guard let index = dataViewControllers.firstIndex(of: viewController),
          index - 1 >= 0
    else {
      return nil
    }
    return dataViewControllers[index - 1]
  }
  
  // 페이지를 오른쪽으로 넘기는 경우 어떤 view controller를 보여줄 것인가?
  func pageViewController(
    _ pageViewController: UIPageViewController,
    viewControllerAfter viewController: UIViewController
  ) -> UIViewController? {
    guard let index = dataViewControllers.firstIndex(of: viewController),
          index + 1 < dataViewControllers.count
    else {
      return nil
    }
    return dataViewControllers[index + 1]
  }
}


// MARK: - UIPageViewControllerDelegate

extension HomeViewController: UIPageViewControllerDelegate {
  
  // 페이지가 넘어간 이후 불려지는 메소드입니다.
  func pageViewController(
    _ pageViewController: UIPageViewController,
    didFinishAnimating finished: Bool,
    previousViewControllers: [UIViewController],
    transitionCompleted completed: Bool) {
      print(#function)
    }
}

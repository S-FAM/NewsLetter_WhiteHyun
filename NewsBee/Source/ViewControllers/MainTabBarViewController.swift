//
//  MainTabBarViewController.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/08.
//

import UIKit

class MainTabBarViewController: UITabBarController {

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .black
    
    
    let vc1 = UINavigationController(rootViewController: HomeViewController())
    let vc2 = UINavigationController(rootViewController: PopularViewController())
    let vc3 = UINavigationController(rootViewController: SearchViewController())
    let vc4 = UINavigationController(rootViewController: AlertViewController())
    let vc5 = UINavigationController(rootViewController: SettingsViewController())
    
    
    vc1.tabBarItem.image = UIImage(systemName: "newspaper")
    vc2.tabBarItem.image = UIImage(systemName: "star")
    vc3.tabBarItem.image = UIImage(systemName: "magnifyingglass")
    vc4.tabBarItem.image = UIImage(systemName: "bell")
    vc5.tabBarItem.image = UIImage(systemName: "gearshape")
    
    vc1.title = "뉴스"
    vc2.title = "인기"
    vc3.title = "검색"
    vc4.title = "알림"
    vc5.title = "설정"
    
    tabBar.tintColor = .white
    tabBar.barTintColor = .white
    tabBar.isTranslucent = false
    
    setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: true)
    
    
    
    
  }


}


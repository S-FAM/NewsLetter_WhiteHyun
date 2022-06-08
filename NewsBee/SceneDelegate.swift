//
//  SceneDelegate.swift
//  NewsBee
//
//  Created by 홍승현 on 2022/06/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
    // 1. windowScene 가져오기
    guard let windowScene = scene as? UIWindowScene else { return }
    
    // 2. window 설정
    window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    
    // 3. window의 windowScene 프로퍼티 설정
    window?.windowScene = windowScene
    
    // 4. rootviewController 설정
    let vc = MainTabBarViewController()
    window?.rootViewController = vc
    
    // 5. 설정한 window를 띄워줌
    window?.makeKeyAndVisible()
    
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.

    // Save changes in the application's managed object context when the application transitions to the background.
    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
  }


}


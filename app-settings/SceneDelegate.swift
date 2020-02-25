//
//  SceneDelegate.swift
//  JustEat
//
//  Created by Farhan Mirza on 14/02/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        setupNavbar()
        
        /* Create ui-view-controller instance*/
        let restaurantsModule =  SummaryRouter.createModule()//RestaurantsRouter.createModule()
        
        /* Initiating instance of ui-navigation-controller with view-controller */
        let navigationController = UINavigationController()
        navigationController.viewControllers = [restaurantsModule]
        
        // Root View Controller
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    
    func setupNavbar() {
        // Nav-Bar
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().barTintColor = UIColor.AppColor.defaultWhite
        UINavigationBar.appearance().tintColor = UIColor.AppColor.defaultRed
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.AppColor.defaultRed, NSAttributedString.Key.font : UIFont(name: FontName.Medium, size: 16)!]
    }
    
    
}


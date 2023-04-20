//
//  MainTabBarController.swift
//  PodHub
//
//  Created by Yamoses on 20/04/2023.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true

        tabBar.tintColor = .purple
        
        setup()
        
    }
   
   //MARK:- Setup function
   private func setup() {
        viewControllers = [generateViewcontroller(with: ViewController(), title: "Favourites", image: UIImage(named: "favorites")!), generateViewcontroller(with: PodcastsController(), title: "Search", image: UIImage(named: "search")!),
                           generateViewcontroller(with: ViewController(), title: "Downloads", image: UIImage(named: "downloads")!)
        ]
    }
    
   //MARK:- Helper function
    
   private func generateViewcontroller(with someViewController: UIViewController, title: String, image: UIImage) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: someViewController)
        someViewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        
        return navController
    }
}

//
//  TabBar.swift
//  ArticleWorks
//
//  Created by Paula Daniela Nieto Ponce on 02-02-23.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         title: String,
                                         image: UIImage) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: MyTutorialsController(), title: NSLocalizedString("My Tutorials", comment: ""), image: UIImage(systemName: "person.crop.circle.fill")!),
            createNavController(for: ViewController(), title: NSLocalizedString("Downloads", comment: ""), image: UIImage(systemName: "arrow.down.circle.fill")!),
            createNavController(for: ArticleDetailsViewController(), title: NSLocalizedString("Library", comment: ""), image: UIImage(systemName: "play.square.stack.fill")!)
        ]
    }
}

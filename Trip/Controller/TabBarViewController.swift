//
//  TabBarViewController.swift
//  Trip
//
//  Created by Terry on 2022/02/02.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    //MARK: -Properties
    
    private lazy var homeViewController : UIViewController = {
        let viewController = HomeViewController()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(systemName: "house"),
                                      tag:0)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var searchViewController : UIViewController = {
        let viewController = SearchViewController()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(systemName: "magnifyingglass"),
                                      tag:1)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var addViewController : UIViewController = {
        let viewController = AddContentViewController()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(systemName: "plus.circle"),
                                      tag:2)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var bookMarkViewController : UIViewController = {
        let viewController = BookMarkViewController()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(systemName: "bookmark"),
                                      tag:3)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var profileViewController : UIViewController = {
        let viewController = ProfileViewController()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(systemName: "person.crop.circle"),
                                      tag:4)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [homeViewController,
                           searchViewController,
                           addViewController,
                           bookMarkViewController,
                           profileViewController]
    }
}

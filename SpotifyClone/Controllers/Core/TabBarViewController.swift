//
//  TabBarViewController.swift
//  SpotifyClone
//
//  Created by karma on 7/27/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let homeVc = HomeViewController()
        let searchVc = SearchViewController()
        let libraryVc = LibraryViewController()
        
        homeVc.title = "Browse"
        searchVc.title = "Search"
        libraryVc.title = "Library"
        
        homeVc.navigationItem.largeTitleDisplayMode = .always
        searchVc.navigationItem.largeTitleDisplayMode = .always
        libraryVc.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: homeVc)
        let nav2 = UINavigationController(rootViewController: searchVc)
        let nav3 = UINavigationController(rootViewController: libraryVc)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 3)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1,nav2,nav3], animated: false)
    }
    
}

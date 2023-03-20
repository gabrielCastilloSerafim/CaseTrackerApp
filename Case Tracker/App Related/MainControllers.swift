//
//  ViewController.swift
//  Case Tracker
//
//  Created by Gabriel Castillo Serafim on 20/3/23.
//

import UIKit

//MARK: - App's Main navigation controller
class MainNavigationController: UINavigationController {
    
    static func createMainNavigationController() -> UINavigationController {
        
        let mainTabController = MainTabController.createMainTabController()
        let mainNavigationController = UINavigationController(rootViewController: mainTabController)
        
        return mainNavigationController
    }
}

//MARK: - App's Main tab bar controller
class MainTabController: UITabBarController {
    
    static func createMainTabController() -> UITabBarController {
        
        let mainTabController = UITabBarController()
        
        // "Example" View Controllers
        
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        vc1.tabBarItem = UITabBarItem(
            title: "First",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill"))
        
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        vc2.tabBarItem = UITabBarItem(
            title: "Second",
            image: UIImage(systemName: "bell"),
            selectedImage: UIImage(systemName: "bell.fill"))
        
        mainTabController.setViewControllers([vc1, vc2], animated: false)
        UITabBar.appearance().barTintColor = .systemBackground
        mainTabController.tabBar.tintColor = .black
        
        return mainTabController
    }
}

//MARK: - "Example" view controllers
class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       setupView()
    }
    
    private lazy var labelOne: UILabel = {
       
        let label = UILabel()
        label.text = "hello".localized(args: ["Jose", "Augusto"])
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var labelTwo: UILabel = {
       
        let label = UILabel()
        label.text = "hello".localized
        label.textAlignment = .center
        
        return label
    }()
    
    func setupView() {
        
        view.backgroundColor = .white
        
        view.addSubview(labelOne)
        view.addSubview(labelTwo)
        
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelTwo.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelOne.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            labelOne.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            labelTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor, constant: 30)
        ])
        
    }
    
}

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
    }
}


//
//  TabBarController.swift
//  Upper_Intermediate_02
//
//  Created by 고도 on 2023/01/19.
//

import UIKit

class TabBarController: UITabBarController {
    private lazy var todayViewController: UIViewController = {
        let viewController = TodayViewController()
        let tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "mail"), tag: 0)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var appViewController: UIViewController = {
        let viewController = UIViewController()
        let tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.up"), tag: 1)
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 어떤 뷰컨트롤러를 표시하려고 하는지
        viewControllers = [todayViewController, appViewController]
    }
}


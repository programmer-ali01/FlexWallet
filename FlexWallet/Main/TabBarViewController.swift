//
//  TabBarViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 12/10/23.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.hidesBackButton = true
        tabBar.layer.masksToBounds = false
        tabBar.layer.borderWidth = 0.0
        tabBar.clipsToBounds = true
        
        tabBar.barTintColor = .black
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.shadowOffset.height = 5
        tabBar.layer.shadowColor = UIColor.lightGray.cgColor
        tabBar.layer.shadowRadius = 8
        tabBar.layer.shadowOpacity = 2
    }
    
    private func setupViewControllers() {
        let homeNavigationVC = UINavigationController()
        if #available(iOS 16.0, *) {
            let home = HomeViewController()
            
            let homeIcon = UIImage(systemName: "plus")
            
            let nav1 = UITabBarItem(title: "Home", image: homeIcon, tag: 0)
            homeNavigationVC.tabBarItem = nav1
            homeNavigationVC.setNavigationBarHidden(true, animated: true)
            homeNavigationVC.pushViewController(home, animated: false)
        } else {
            // Fallback on earlier versions
        }
       
        let dashboardNavigationVC = UINavigationController()
        let dashboard = DashboardViewController()
        let dashboardImage = UIImage(systemName: "circle")
        
        let nav2 = UITabBarItem(title: "Dashboard", image: dashboardImage, tag: 1)
        dashboardNavigationVC.tabBarItem = nav2
        dashboardNavigationVC.setNavigationBarHidden(true, animated: true)
        dashboardNavigationVC.pushViewController(dashboard, animated: false)
        
        let accountsNavigationVC = UINavigationController()
        let accounts = AccountsViewController(viewModel: AccountsViewModel())
        let accountsImage = UIImage(systemName: "circle.fill")
        
        let nav3 = UITabBarItem(title: "Accounts", image: accountsImage, tag: 2)
        accountsNavigationVC.tabBarItem = nav3
        accountsNavigationVC.setNavigationBarHidden(true, animated: true)
        accountsNavigationVC.pushViewController(accounts, animated: false)
        
        let settingsNavigationVC = UINavigationController()
        let settings = SettingsViewController()
        let settingsImage = UIImage(systemName: "minus")
        
        let nav4 = UITabBarItem(title: "Settings", image: settingsImage, tag: 3)
        settingsNavigationVC.tabBarItem = nav4
        settingsNavigationVC.setNavigationBarHidden(true, animated: true)
        settingsNavigationVC.pushViewController(settings, animated: false)
        
        self.viewControllers = [homeNavigationVC, dashboardNavigationVC, accountsNavigationVC, settingsNavigationVC]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

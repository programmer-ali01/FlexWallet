//
//  DashboardViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/7/24.
//

import UIKit

final class DashboardViewController: UIViewController {
    
    let customHeader = CustomHeader(title: "Dashboard", hideBackButton: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
    }
}

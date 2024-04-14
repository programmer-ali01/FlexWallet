//
//  Extensions.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 1/25/24.
//

import UIKit

extension UIViewController {
    func showTabBar(_ state: Bool) {
        tabBarController?.tabBar.enableTabBarItems(state)
    }
}

extension UITabBar {
    func enableTabBarItems(_ state: Bool) {
        if let items = self.items {
            for i in 0..<items.count {
                let itemToDisable = items[i]
                itemToDisable.isEnabled = state
            }
        }
        self.isHidden = !state
        self.layer.zPosition = state ? 0 : -1
    }
}

extension UIView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            self.addSubview(view)
        }
    }
    
    func createLineView(frame: CGRect) -> UIView {
        let lineView = UIView(frame: frame)
        let lineLayer = CAShapeLayer()
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.height / 2))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height / 2))
        lineLayer.path = path.cgPath
        lineLayer.strokeColor = UIColor.black.cgColor
        lineLayer.lineWidth = 1
        lineView.layer.addSublayer(lineLayer)
        return lineView
    }
}

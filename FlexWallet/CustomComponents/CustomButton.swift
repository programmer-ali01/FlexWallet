//
//  CustomButton.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 12/2/23.
//
import UIKit

class CustomButton: UIButton {
    
    init(frame: CGRect = .zero,
         title: String,
         backgroundColor: UIColor,
         titleColor: UIColor,
         cornerRadius: CGFloat,
         borderWidth: CGFloat,
         borderColor: UIColor,
         height: CGFloat? = nil,
         width: CGFloat? = nil
    ) {
        super.init(frame: frame)
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        self.backgroundColor = backgroundColor
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        
        self.frame = CGRect(x: 0, y: 0, width: width ?? 0, height: height ?? 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Methods
}

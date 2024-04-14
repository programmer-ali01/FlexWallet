//
//  AccountsView.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit

final class AccountsView: UIView {
    
    let customHeader = CustomHeader(title: "Accounts", hideBackButton: true)
    
    let accountsDescription: UILabel = {
        let label = UILabel()
        label.text = "You can integrate your bank account and gig platforms you currently work with to view your transaction data"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        return label
    }()
    
    let menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = UIColor.black
        return button
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.isScrollEnabled = false
        collection.backgroundColor = .lightGray
        collection.layer.cornerRadius = 8
       return collection
    }()
    
    let scrollView: UIScrollView = {
       let scroll = UIScrollView()
        scroll.isScrollEnabled = true
        scroll.showsVerticalScrollIndicator = false
        scroll.bounces = true
        return scroll
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
       // super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        addSubviews([customHeader, scrollView])
        scrollView.addSubviews([
                                accountsDescription,
                                menuButton,
                                collectionView])
    }
    
    func setupUI() {
        backgroundColor = .white
        addSubviews()
  //      addConstraints()
    }
    
    func addConstraints(accountCellCount: Int) {
        customHeader.anchor(top: topAnchor,
                            left: leftAnchor,
                            right: rightAnchor, paddingTop: 0, height: 120)
        scrollView.anchor(top: customHeader.bottomAnchor, left: leftAnchor, right: rightAnchor, height: UIScreen.main.bounds.height)
        menuButton.anchor(top: scrollView.topAnchor, right: rightAnchor, paddingTop: 20, paddingRight: 20, height: 48)
        accountsDescription.anchor(top: menuButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        configureCollectionConstraints(accountCellCount: accountCellCount)

//        bankAccountButton.anchor(top: accountsDescription.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingLeft: 24, paddingRight: 24)
//        uberAccountButton.anchor(top: bankAccountButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingLeft: 24, paddingRight: 24)
//        deliverooAccountButton.anchor(top: uberAccountButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingLeft: 24, paddingRight: 24)
//        upworkAccountButton.anchor(top: deliverooAccountButton.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingLeft: 24, paddingRight: 24)
    }
    
    func configureCollectionConstraints(accountCellCount: Int) {
        collectionView.anchor(top: accountsDescription.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 20, paddingLeft: 24, paddingRight: 24, width: UIScreen.main.bounds.size.width,  height: CGFloat(accountCellCount) * 100)
    }
}

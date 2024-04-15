//
//  AccountsViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit
import Charts

protocol AddAccountDelegate: AnyObject {
    func didPressConfirm()
}

final class AccountsViewController: UIViewController, UIScrollViewDelegate {
  
    private var customView: AccountsView = AccountsView()
    
    private var viewModel: AccountsViewModel
    
    init(viewModel: AccountsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view = customView
       
        addActions()
        fetchAccountsData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    func fetchAccountsData() {
        viewModel.fetchAccountsData { accounts, _ in
            self.viewModel.accountsCellData = accounts ?? []
            print("DEBUG: \(self.viewModel.accountsCellData)")
            DispatchQueue.main.async {
                self.customView.collectionView.reloadData()
            }
        }
    }
    
    func addActions() {
        customView.menuButton.addTarget(self, action: #selector(showAddAccount), for: .touchUpInside)
    }
    
    func setupUI() {
        customView.setupUI()
        customView.addConstraints(accountCellCount: viewModel.accountsCellData.count)
        setupCollectionView()
        customView.scrollView.delegate = self
        customView.scrollView.frame = view.bounds
        customView.scrollView.contentSize = CGSize(width: view.bounds.width, height: 2000)
    }
    
    func setupCollectionView() {
        customView.collectionView.delegate = self
        customView.collectionView.dataSource = self
        customView.collectionView.register(AccountCell.self, forCellWithReuseIdentifier: "accountCell")
    }
    
    @objc func showAddAccount() {
        let addAccountVC = AddAccountViewController(viewModel: AddAccountViewModel())
//        addAccountVC.modalPresentationStyle = .formSheet
//        addAccountVC.modalTransitionStyle = .coverVertical
        navigationController?.pushViewController(addAccountVC, animated: true)
    }
    
//    @objc func showActionSheet() {
//          // Create an instance of UIAlertController with preferredStyle set to .actionSheet
//          let actionSheet = UIAlertController(title: "Choose an option", message: nil, preferredStyle: .actionSheet)
//          
//          // Add actions to the action sheet
//          let action1 = UIAlertAction(title: "Option 1", style: .default) { (action) in
//              // Handle Option 1 action
//              let a = AddAccountViewController()
//              self.navigationController?.pushViewController(a, animated: true)
//          }
//          
//          let action2 = UIAlertAction(title: "Option 2", style: .default) { (action) in
//              // Handle Option 2 action
//              print("Option 2 selected")
//          }
//          
//          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//          
//          // Add actions to the action sheet
//          actionSheet.addAction(action1)
//          actionSheet.addAction(action2)
//          actionSheet.addAction(cancelAction)
//          
//          // Present the action sheet
//          present(actionSheet, animated: true, completion: nil)
//      }
}

extension AccountsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.accountsCellData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "accountCell", for: indexPath) as? AccountCell else { return UICollectionViewCell() }
        cell.configureCell(with: viewModel.accountsCellData[indexPath.row])
        return cell
    }
}

extension AccountsViewController: AddAccountDelegate {
    func didPressConfirm() {
        fetchAccountsData()
        DispatchQueue.main.async {
            self.customView.collectionView.reloadData()
        }
    }
}

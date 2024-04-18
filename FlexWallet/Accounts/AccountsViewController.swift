//
//  AccountsViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit

final class AccountsViewController: UIViewController, UIScrollViewDelegate {
  
    private var customView: AccountsView = AccountsView()
    
    var viewModel: AccountsViewModel
    
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
        fetchAccountsData()
        showTabBar(true)
    }
    
    func fetchAccountsData() {
        viewModel.fetchAccountsData { accounts, _ in
            self.viewModel.accountsCellData = accounts ?? []
            print("DEBUG: \(self.viewModel.accountsCellData)")
            DispatchQueue.main.async {
             //   self.customView.collectionView.reloadData()
                self.customView.tableView.reloadData()
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
        
        customView.tableView.delegate = self
        customView.tableView.dataSource = self
        customView.tableView.register(AccountCell.self, forCellReuseIdentifier: "accountCell")
    }
    
    @objc func showAddAccount() {
        let addAccountVC = AddAccountViewController(viewModel: AddAccountViewModel())
        navigationController?.pushViewController(addAccountVC, animated: true)
        showTabBar(false)
    }
}

extension AccountsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.accountsCellData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let accountTransactionView = AccountTransactionViewController(viewModel: AccountTransactionViewModel(type: viewModel.accountsCellData[indexPath.row].platform))
        navigationController?.pushViewController(accountTransactionView, animated: true)
        showTabBar(false)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountCell", for: indexPath) as? AccountCell
        cell?.configureCell(with: viewModel.accountsCellData[indexPath.row])
        return cell!
    }
    
}

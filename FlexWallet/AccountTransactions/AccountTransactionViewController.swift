//
//  AccountTransactionViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 4/15/24.
//

import Foundation
import UIKit
    
final class AccountTransactionViewController: UIViewController {
    private var customView: AccountTransactionView = AccountTransactionView()
    
    private var viewModel: AccountTransactionViewModel
    
    init(viewModel: AccountTransactionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view = customView
    
        addActions()
        fetchAccountData()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
     //   fetchBankAccountData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
       fetchAccountData()
    }
    
    @objc func goBack() {
        navigationController?.popToRootViewController(animated: true)
        showTabBar(true)
    }
    
    func fetchAccountData() {
        viewModel.fetchCorrectData()
        customView.tableView.reloadData()
    }
    
    func addActions() {
        customView.customHeader.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)

    }
    
    func setupUI() {
        customView.setupUI()
        setupTableView()
    }
    
    func setupTableView() {
        customView.tableView.dataSource = self
        customView.tableView.delegate = self
        customView.tableView.register(AccountTransactionCell.self, forCellReuseIdentifier: "accountTransactionCell")
    }
    
}

extension AccountTransactionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("DEBUG 4: \(viewModel.allUberEarnings)")
        var count: Int = 0
        if viewModel.type == "Bank account" {
            count = viewModel.allTransactions.count
        }
        if viewModel.type == "Uber" {
            count = viewModel.allUberEarnings.count
        }
        if viewModel.type == "Deliveroo" {
            count = viewModel.allDeliverooEarnings.count
        }
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountTransactionCell", for: indexPath) as? AccountTransactionCell
       // print("DEBUG: 2 \(viewModel.allTransactions[indexPath.row].amount)")
        if viewModel.type == "Bank account" {
            cell?.configure(with: String(viewModel.allTransactions[indexPath.row].amount))
        }
        if viewModel.type == "Uber" {
            cell?.configure(with: String(viewModel.allUberEarnings[indexPath.row].earnings))
        }
        if viewModel.type == "Deliveroo" {
            cell?.configure(with: String(viewModel.allDeliverooEarnings[indexPath.row].earnings))
        }
        return cell!
    }
}

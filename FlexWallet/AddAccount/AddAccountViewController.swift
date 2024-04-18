//
//  AddAccountViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit

final class AddAccountViewController: UIViewController {
    
    private var viewModel: AddAccountViewModel
    
    private var customView: AddAccountView = AddAccountView()
    
    init(viewModel: AddAccountViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view = customView
        customView.setupUI()
        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func addActions() {
        customView.confirmButton.addTarget(self, action: #selector(confirm), for: .touchUpInside)
        customView.addAccountButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        customView.customHeader.backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
    }
    
    @objc func confirm() {
        viewModel.sendAccountDataToFireStore(title: customView.usernameTextField.text ?? "", platform: customView.platformLabel.text ?? "", type: "")
            self.navigationController?.popViewController(animated: true)
 
    }
    
    @objc func goBack() {
        navigationController?.popToRootViewController(animated: true)
        showTabBar(true)
    }
    
    @objc func showActionSheet() {
          // Create an instance of UIAlertController with preferredStyle set to .actionSheet
          let actionSheet = UIAlertController(title: "Choose an option", message: nil, preferredStyle: .actionSheet)

          // Add actions to the action sheet
          let action1 = UIAlertAction(title: "Bank account", style: .default) { (action) in
              // Handle Option 1 action
           //   self.addAccountButton.setTitle("Option1", for: .normal)
              self.customView.platformLabel.text = "Bank account"
          }

          let action2 = UIAlertAction(title: "Uber", style: .default) { (action) in
              // Handle Option 2 action
           //   self.addAccountButton.setTitle("Option2", for: .normal)
              self.customView.platformLabel.text = "Uber"
          }
        
        let action3 = UIAlertAction(title: "Deliveroo", style: .default) { (action) in
            // Handle Option 2 action
         //   self.addAccountButton.setTitle("Option2", for: .normal)
            self.customView.platformLabel.text = "Deliveroo"
        }
    
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

          // Add actions to the action sheet
          actionSheet.addAction(action1)
          actionSheet.addAction(action2)
          actionSheet.addAction(action3)
          actionSheet.addAction(cancelAction)

          // Present the action sheet
        navigationController?.present(actionSheet, animated: true, completion: nil)
      }

}

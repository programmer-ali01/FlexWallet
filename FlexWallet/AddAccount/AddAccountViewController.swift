//
//  AddAccountViewController.swift
//  FlexWallet
//
//  Created by Alisena Mudaber on 2/25/24.
//

import UIKit

final class AddAccountViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    let data = ["Option 1", "Option 2", "Option 3"]
    var pickerView: UIPickerView!
    var textField: UITextField!
    var button = UIButton()
    
    var delegate: AddAccountDelegate?
    
   // private var customView: AddAccountView
    
    private var viewModel: AddAccountViewModel
    
    init(viewModel: AddAccountViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
      //  self.view = customView
//        setupUI()
//        addActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Create text field
              textField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
              textField.borderStyle = .roundedRect
              textField.placeholder = "Select an option"
              textField.addTarget(self, action: #selector(showDropdown), for: .touchDown)
              view.addSubviews([textField, button])
              
              // Create UIPickerView
              pickerView = UIPickerView()
              pickerView.delegate = self
              pickerView.dataSource = self
              
              // Set UIPickerView as input view for text field
              textField.inputView = pickerView
        
        textField.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 50, paddingLeft: 32, paddingRight: 32, height: 40)
        button.anchor(top: textField.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 20, paddingLeft: 32, paddingRight: 32, height: 50)
        
        button.addTarget(self, action: #selector(confirm), for: .touchUpInside)
    }
    
    @objc func confirm() {
        viewModel.sendAccountDataToFireStore()
    //    delegate?.didPressConfirm()
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func showDropdown() {
        // Show UIPickerView when text field is tapped
        textField.becomeFirstResponder()
    }
    
    // MARK: - UIPickerViewDataSource methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // For single component
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    // MARK: - UIPickerViewDelegate methods
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Update text field with selected option
        textField.text = data[row]
        
        textField.resignFirstResponder()
    }
}

//
//  ViewController.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import UIKit

class LoginViewController: BaseUIViewController {

  // MARK: IBOutlets
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextfield: UITextField!
  
  // MARK: Properties
  private lazy var viewModel = LoginViewModel()
  
  // MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.delegate = self
  }
  
  // MARK: Functions
  private func showMainViewController() {
    navigationController?.show(MainViewController(), sender: nil)
  }
  
  private func checkUserAuth() {
    viewModel.checkUserAuth(userNameTextField.text, password: passwordTextfield.text)
  }
  
  // MARK: Actions
  @IBAction func loginButtonAction(_ sender: UIButton) {
    checkUserAuth()
  }
  
}

// MARK: - Extensions
extension LoginViewController: LoginViewModelDelegete {
  func handleOutput(_ output: LoginViewModelOutput) {
    switch output {
    case .didLogin(let result):
      switch result {
      case .success:
        showMainViewController()
      case .failure(let error):
        showErrorController(with: error)
      }
    }
  }
}

extension LoginViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    switch textField.tag {
    case 0:
      passwordTextfield.becomeFirstResponder()
    default:
      checkUserAuth()
    }
    return true
  }
}

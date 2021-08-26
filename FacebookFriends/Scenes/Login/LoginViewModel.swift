//
//  LoginViewModel.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import Foundation

class LoginViewModel {
  
  // MARK: Properties
  private let validUsernames = ["9nd54", "v542w", "17pcy0", "gbf48", "zdah4"]
  weak var delegate: LoginViewModelDelegete?
  
  
  func checkUserAuth(_ userName: String?, password: String?) {
    guard let username = userName, let _ = password else {
      delegate?.handleOutput(.didLogin(.failure(GeneralError.invalidCredentials)))
      return
    }
    let isValid = isValidUsername(username)
    isValid ? delegate?.handleOutput(.didLogin(.success(()))) : delegate?.handleOutput(.didLogin(.failure(GeneralError.invalidAuth)))
  }
  
  private func isValidUsername(_ username: String) -> Bool {
    return validUsernames.contains(username)
  }
  
}

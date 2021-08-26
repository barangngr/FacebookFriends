//
//  LoginContracts.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import Foundation

enum LoginViewModelOutput {
  case didLogin(_ result: Result<Void, Error>)
}

protocol LoginViewModelDelegete: AnyObject {
  func handleOutput(_ output: LoginViewModelOutput)
}

//
//  GeneralError.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import UIKit

enum GeneralError: Error {
  case invalidCredentials
  case invalidAuth
  case parseError
  case notConnected
}

extension GeneralError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .invalidCredentials:
      return "Username or Password cannot be empty."
    case .invalidAuth:
      return "Invalid password or username"
    case .parseError:
      return "Model Parse Error"
    case .notConnected:
      return "You have no internet connection"
    }
  }
}


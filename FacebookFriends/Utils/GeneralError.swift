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
}

extension GeneralError: LocalizedError {
  var errorDescription: String? {
    switch self {
    case .invalidCredentials:
      return "Username or Password cannot be empty."
    case .invalidAuth:
      return "Invalid password or username"
    }
  }
}


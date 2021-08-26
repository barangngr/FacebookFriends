//
//  MainContracts.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import Foundation

enum MainModelOutput {
  case didFetchList(_ result: Result<[UserListResponseModel], Error>)
}

protocol MainViewModelDelegete: AnyObject {
  func handleOutput(_ output: MainModelOutput)
}

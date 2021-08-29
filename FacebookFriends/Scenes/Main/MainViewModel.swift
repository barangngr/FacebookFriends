//
//  MainViewModel.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import Foundation

class MainViewModel {
  
  weak var delegate: MainViewModelDelegete?
  
  func fetchFriends() {
    NetworkManager.shared.request(API.getUserList, type: GeneralResponseModel.self) { [weak self] (result) in
      guard let self = self else { return }
      switch result {
      case .success(let data):
        if let list = data.results {
          self.delegate?.handleOutput(.didFetchList(.success(list)))
        }
      case .failure(let error):
        self.delegate?.handleOutput(.didFetchList(.failure(error)))
      }
    }
  }
  
}

//
//  NetworkManager.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import UIKit
import Moya
import Alamofire

class NetworkManager {
  
  static let shared = NetworkManager()
  private let reachabilityManager = NetworkReachabilityManager()
  let provider = MoyaProvider<MultiTarget>()
  
  func request<T: Codable>(_ target: TargetType,
                           type: T.Type,
                           completion:  @escaping ((Result<T, Error>) -> Void)) {
    
    guard let reachabilityManager = reachabilityManager, reachabilityManager.isReachable else {
      completion(.failure(GeneralError.notConnected))
      return
    }
    
    provider.request(MultiTarget(target)) { (result) in
      switch result {
      case .success(let response):
        do {
          let response = try JSONDecoder().decode(T.self, from: response.data)
          completion(.success(response))
        } catch {
          completion(.failure(GeneralError.parseError))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
}

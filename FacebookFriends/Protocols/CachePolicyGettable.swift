//
//  CachePolicyGettable.swift
//  FacebookFriends
//
//  Created by Baran on 29.08.2021.
//

import Foundation
import Moya

protocol CachePolicyGettable {
  var cachePolicy: URLRequest.CachePolicy { get }
}

final class CachePolicyPlugin: PluginType {
  public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
    if let cachePolicyGettable = target as? CachePolicyGettable {
      var mutableRequest = request
      mutableRequest.cachePolicy = cachePolicyGettable.cachePolicy
      return mutableRequest
    }
    
    return request
  }
}

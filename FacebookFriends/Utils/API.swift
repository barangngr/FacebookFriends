//
//  API.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import Moya

enum API {
  case getUserList
}

extension API: TargetType {
  
  var baseURL: URL {
    return URL(string: "https://randomuser.me/api/?results=20")!
  }
  
  var path: String{
      switch self {
      case .getUserList:
          return ""
      }
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var headers: [String : String]? {
    return nil
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .getUserList:
      return .requestPlain
    }
  }
  
}

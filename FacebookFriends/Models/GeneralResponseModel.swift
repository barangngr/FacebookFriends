//
//  GeneralResponseModel.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import Foundation

public class GeneralResponseModel: Codable {
  public var results: [UserListResponseModel]?
  public var info: InfoResponseModel?
}

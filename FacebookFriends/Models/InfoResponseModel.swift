//
//  InfoResponseModel.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import Foundation

public class InfoResponseModel: Codable {
  public var seed: String?
  public var results: Int?
  public var page: Int?
  public var version: String?
}

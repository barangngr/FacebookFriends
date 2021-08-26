//
//  UserListResponseModel.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import Foundation

public class UserListResponseModel: Codable {
  public var gender: String?
  public var name: NameModel?
  public var location: LocationModel?
  public var email: String?
  public var login: LoginModel?
  public var dob: DateModel?
  public var registered: DateModel?
  public var phone: String?
  public var cell: String?
//  public var id: String?
  public var picture: PictureModel?
  public var nat: String?
}

public class NameModel: Codable {
  public var title: String?
  public var first: String?
  public var last: String?
}

public class LocationModel: Codable {
  public var city: String?
  public var state: String?
  public var country: String?
  public var coordinates: CoordinateModel?
}

public class CoordinateModel: Codable {
  public var latitude: String?
  public var longitude: String?
}

public class PictureModel: Codable {
  public var large: String?
  public var medium: String?
  public var thumbnail: String?
}

public class DateModel: Codable {
  public var date: String?
  public var age: Int?
}

public class LoginModel: Codable {
  public var username: String?
  public var uuid: String?
}




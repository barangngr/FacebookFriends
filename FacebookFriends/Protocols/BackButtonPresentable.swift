//
//  BackButtonPresentable.swift
//  FacebookFriends
//
//  Created by Baran on 28.08.2021.
//

import UIKit

protocol BackButtonPresentable: AnyObject {}

extension BackButtonPresentable where Self: UIViewController {
  
  func configureBackButton(title: String = "", color: UIColor = .americanRed) {
    let backButton = UIBarButtonItem()
    backButton.title = title
    backButton.tintColor = color
    self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
  }
  
}

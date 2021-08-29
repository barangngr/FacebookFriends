//
//  UINavigationBar.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import UIKit

extension UINavigationBar {
  
  func setTitleFont(_ font: UIFont, color: UIColor = .black) {
    var attrs = [NSAttributedString.Key: Any]()
    attrs[.font] = font
    attrs[.foregroundColor] = color
    titleTextAttributes = attrs
  }
  
  func makeTransparent(withTint tint: UIColor = .white) {
    isTranslucent = true
    backgroundColor = .clear
    barTintColor = .clear
    setBackgroundImage(UIImage(), for: .default)
    tintColor = tint
    titleTextAttributes = [.foregroundColor: tint]
    shadowImage = UIImage()
  }
  
}

//
//  DetailLabel.swift
//  FacebookFriends
//
//  Created by Baran on 28.08.2021.
//

import UIKit

class DetailLabel: UILabel {
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
    self.commonInit()
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.commonInit()
  }
  
  func commonInit(){
    self.translatesAutoresizingMaskIntoConstraints = false
    self.textColor = .white
    self.textAlignment = .left
    self.numberOfLines = 0
    self.font = UIFont.systemFont(ofSize: 17.0)
    self.adjustsFontSizeToFitWidth = true
  }
  
}

//
//  BaseUICollectionViewCell.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import UIKit

class BaseUICollectionViewCell: UICollectionViewCell {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    configureViews()
  }
  
  func configureViews() {}
  
}

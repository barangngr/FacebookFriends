//
//  MainCollectionViewCell.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: BaseUICollectionViewCell {
  
  // MARK: Properties
  var imageView = UIImageView().with({
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  })
  
  private var usernameLabel = UILabel().with({
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .white
    $0.textAlignment = .left
    $0.font = UIFont.boldSystemFont(ofSize: 17.0)
    $0.adjustsFontSizeToFitWidth = true
  })
  
  private var fullNameLabel = UILabel().with({
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .white
    $0.textAlignment = .left
    $0.font = UIFont.systemFont(ofSize: 13.0)
    $0.adjustsFontSizeToFitWidth = true
  })
  
  override func layoutSubviews() {
    super.layoutSubviews()
    imageView.layer.cornerRadius = 30
  }
    
  // MARK: Functions
  override func configureViews() {
    addSubview(views: imageView, usernameLabel, fullNameLabel)
    
    imageView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
  
    usernameLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 5).isActive = true
    usernameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15).isActive = true
    usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    
    fullNameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 2).isActive = true
    fullNameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15).isActive = true
    fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
  }
  
  func configure(with model: UserListResponseModel?) {
    usernameLabel.text = model?.login?.username
    fullNameLabel.text = "\(model?.name?.first ?? "") \(model?.name?.last ?? "")"
    imageView.kf.setImage(with: URL(string: model?.picture?.medium ?? ""))
  }
  
}

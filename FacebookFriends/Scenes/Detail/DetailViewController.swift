//
//  DetailViewController.swift
//  FacebookFriends
//
//  Created by Baran on 28.08.2021.
//

import UIKit
import Kingfisher

class DetailViewController: BaseUIViewController, BackButtonPresentable {
  
  // MARK: Properties
  private var imageView = UIImageView().with({
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  })
  
  private var usernameLabel = UILabel().with({
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .white
    $0.textAlignment = .left
    $0.font = UIFont.boldSystemFont(ofSize: 25.0)
    $0.adjustsFontSizeToFitWidth = true
  })
  
  private var mailLabel = UILabel().with({
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.textColor = .white
    $0.textAlignment = .left
    $0.numberOfLines = 0
    $0.font = UIFont.systemFont(ofSize: 15.0)
    $0.adjustsFontSizeToFitWidth = true
  })
  
  private var infoContainerView = UIView().with({
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.backgroundColor = .clear
  })
  
  private var locationButton = UIButton().with({
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.setTitleColor(.americanRed, for: .normal)
    $0.titleLabel?.font = .systemFont(ofSize: 16)
    $0.addTarget(self, action: #selector(Self.locataionButtonAction(_:)), for: .touchUpInside)
  })
  
  private var fullNameLabel = DetailLabel()
  private var addressLabel = DetailLabel()
  private var phoneLabel = DetailLabel()
  private var registerDateLabel = DetailLabel()
  
  var dataSource: UserListResponseModel?
  
  // MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .charlestonGreen
    title = "Infos"
    configureBackButton()
    configure()
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    imageView.layer.cornerRadius = 60
  }
  
  // MARK: Functions
  override func configureViews() {
    view.addSubview(views: imageView, usernameLabel, mailLabel, infoContainerView, locationButton)
    infoContainerView.fill(.horizontally)
    
    imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
    imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    
    usernameLabel.bottomAnchor.constraint(equalTo: imageView.centerYAnchor, constant: -10).isActive = true
    usernameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20).isActive = true
    usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    
    mailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 4).isActive = true
    mailLabel.centerXAnchor.constraint(equalTo: usernameLabel.centerXAnchor).isActive = true
    mailLabel.widthAnchor.constraint(equalTo: usernameLabel.widthAnchor).isActive = true
    
    infoContainerView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
    infoContainerView.bottomAnchor.constraint(equalTo: locationButton.topAnchor, constant: -5).isActive = true
    
    locationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    locationButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
    locationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
    
    configureContainerView()
  }
  
  private func configureContainerView() {
    let views = [fullNameLabel, phoneLabel, addressLabel, registerDateLabel]
    infoContainerView.addSubview(views: views)
    views.forEach({$0.fill(.horizontally, with: 15)})
    infoContainerView.addConstraints("V:|[v0]-15-[v1]-15-[v2]-15-[v3]", views: fullNameLabel, phoneLabel, addressLabel, registerDateLabel)
  }
  
  private func configure() {
    guard let data = dataSource else { return }
    imageView.kf.setImage(with: URL(string: data.picture?.large ?? ""))
    usernameLabel.text = data.login?.username
    mailLabel.text = data.email
    locationButton.setTitle(data.isMale ? "Look his location" : "Look her location", for: .normal)
    fullNameLabel.text = data.fullName
    addressLabel.text = data.address
    phoneLabel.text = data.phone
    registerDateLabel.text = "\(data.registered?.age ?? 0) years member"
  }
  
  // MARK: Actions
  @objc func locataionButtonAction(_ sender: UIButton) {
    print(dataSource?.location?.coordinates?.latitude)
    print(dataSource?.location?.coordinates?.longitude)
  }
  
}

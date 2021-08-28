//
//  MainViewController.swift
//  FacebookFriends
//
//  Created by Baran on 26.08.2021.
//

import UIKit

class MainViewController: BaseUIViewController, LoadingViewPresentable {
  
  // MARK: Properties
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 10
    layout.minimumInteritemSpacing = 10
    layout.sectionInset = .zero
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.register(cellWithClass: MainCollectionViewCell.self)
    cv.backgroundColor = .clear
    cv.showsVerticalScrollIndicator = false
    return cv
  }()
  
  private var dataSource: [UserListResponseModel] = []
  private lazy var viewModel = MainViewModel()
  
  // MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .charlestonGreen
    configureNavigationBar()
    load()
    viewModel.delegate = self
    collectionView.delegate = self
    collectionView.dataSource = self
  }
  
  // MARK: Functions
  override func configureViews() {
    view.addSubview(collectionView)
    collectionView.fill(.horizontally)
    collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  private func configureNavigationBar() {
    title = "FacebookFriends"
    navigationController?.setNavigationBarHidden(false, animated: false)
    navigationController?.navigationBar.makeTransparent()
    navigationItem.setHidesBackButton(true, animated: false)
    navigationController?.navigationBar.setTitleFont(UIFont(name: "HelveticaNeue-Bold", size: 23)!, color: .americanRed)
  }
  
  private func load() {
    startAnimating()
    viewModel.fetchFriends()
  }
  
}

// MARK: - Extension
extension MainViewController: MainViewModelDelegete {
  func handleOutput(_ output: MainModelOutput) {
    switch output {
    case .didFetchList(let result):
      stopAnimating()
      switch result {
      case .success(let data):
        dataSource = data
        collectionView.reloadData()
      case .failure(let error):
        showErrorController(with: error)
      }
    }
  }
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withClass: MainCollectionViewCell.self, for: indexPath)
    cell.configure(with: dataSource[indexPath.item])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let targetController = DetailViewController()
    targetController.dataSource = dataSource[indexPath.item]
    navigationController?.show(targetController, sender: nil)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = collectionView.calculateWidth(for: 1)
    return CGSize(width: width, height: 80)
  }
    
}

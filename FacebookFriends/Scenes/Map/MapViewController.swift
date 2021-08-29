//
//  MapViewController.swift
//  FacebookFriends
//
//  Created by Baran on 28.08.2021.
//

import UIKit
import MapKit

class MapViewController: BaseUIViewController, BackButtonPresentable {
  
  // MARK: Properties
  let mapView = MKMapView().with({
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.mapType = .standard
    $0.isZoomEnabled = true
    $0.isScrollEnabled = true
  })
  
  let annotations = MKPointAnnotation()
  var model: MapViewCoordinateModel?
  
  // MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureBackButton()
    configureMap()
  }
  
  // MARK: Functions
  override func configureViews() {
    view.addSubview(mapView)
    mapView.fill(.horizontally)
    mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
  private func configureMap() {
    guard let model = model else { return }
    annotations.title = model.name
    annotations.coordinate = CLLocationCoordinate2D(latitude: model.lat, longitude: model.long)
    mapView.addAnnotation(annotations)
    
    let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: model.lat, longitude: model.long), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    DispatchQueue.main.async {
      self.mapView.setRegion(region, animated: true)
    }
  }
  
}

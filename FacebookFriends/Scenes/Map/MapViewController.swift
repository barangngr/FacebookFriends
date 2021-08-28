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
  
  var model: CoordinateModel?
  
  // MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureBackButton()
    
    let annotations = MKPointAnnotation()
    annotations.title = "12312312"
    let dbLat = Double(model?.latitude ?? "") ?? 0.0
    let dbLong = Double(model?.longitude ?? "") ?? 0.0
    annotations.coordinate = CLLocationCoordinate2D(latitude: dbLat, longitude: dbLong)
    mapView.addAnnotation(annotations)
  }
  
  // MARK: Functions
  override func configureViews() {
    view.addSubview(mapView)
    mapView.fill(.horizontally)
    mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
  }
  
}

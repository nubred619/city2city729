//
//  MapViewController.swift
//  City2City729
//
//  Created by mac on 8/8/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    var city: City! //dependency injection, whenever a dependency for an object is set from outside the declaration
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMap()
        setupBarButtonItems()
    
    }
    
    
    private func setupMap() {
        
        definesPresentationContext = true
        let region = MKCoordinateRegion(center: city.coordinates, latitudinalMeters: 10000, longitudinalMeters: 10000)
        
        let location = MKPointAnnotation()
        location.coordinate = city.coordinates
        location.title = city.name
        location.subtitle = city.state
        mapView.addAnnotation(location)
        mapView.delegate = self
        mapView.region = region
    }
    
    private func setupBarButtonItems() {
        
        let searchbuttonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        let weatherButtonItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(weatherButtonTapped))
        navigationItem.rightBarButtonItems = [searchbuttonItem, weatherButtonItem]
        
    
    }
    
    @objc func searchButtonTapped() {
        
        
    }
    
    
    @objc func weatherButtonTapped() {
        
    }
    

}

//MARK: MapView Delegate
extension MapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is MKPointAnnotation else {return nil}
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "annotation")
        
        switch annotationView == nil {
        case true:
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
            annotationView?.canShowCallout = true
        case false:
            annotationView?.annotation = annotation
        }
        
        
        return annotationView
    }
    
}

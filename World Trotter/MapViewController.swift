//
//  MapViewController.swift
//  World Trotter
//
//  Created by Allen McKinstry on 11/04/2016.
//  Copyright © 2016 Allen McKinstry. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        generateSegmentController()
        generateButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("MapViewController loaded its view.")
    }
    
    func generateButton() -> () {
        let locationButton = UIButton(type: .InfoLight)
        locationButton.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(locationButton)
        
        let bottomConstraint = locationButton.bottomAnchor.constraintEqualToAnchor(bottomLayoutGuide.topAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingcontstraint = locationButton.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        bottomConstraint.active = true
        leadingcontstraint.active = true
        
    }
    func generateSegmentController() -> () {
        let segmentedControl = UISegmentedControl(items: ["Standard", "Hybrid", "Satelite"])
        segmentedControl.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: "mapTypeChanged:", forControlEvents: .ValueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor, constant: 8)
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraintEqualToAnchor(margins.leadingAnchor)
        let trailingContraint = segmentedControl.trailingAnchor.constraintEqualToAnchor(margins.trailingAnchor)
        topConstraint.active = true
        leadingConstraint.active = true
        trailingContraint.active = true
    }
    
    func mapTypeChanged(segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .Standard
        case 1:
            mapView.mapType = .Satellite
        case 2:
            mapView.mapType = .Hybrid
        default:
            break
        }
    }
}

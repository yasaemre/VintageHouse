//
//  LocationsViewController.swift
//  Ragnar
//
//  Created by Home on 9/24/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import MapKit
import WebKit
class HouseLocationViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var viewContainer: UIView!
    @IBOutlet var viewMapButton: UIButton!
    @IBOutlet var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let istOffAnnotation = Location(title: "Vintage House", coordinate: CLLocationCoordinate2D(latitude: 37.718508810201115, longitude: -122.44325419736668))
        let istanbulOffice = CLLocation(latitude: 37.718508810201115, longitude: -122.44325419736668)
        mapView.centerToLocation(istanbulOffice)
        mapView.addAnnotation(istOffAnnotation)
        mapView.delegate = self
        viewMapButton.layer.masksToBounds = true
        viewMapButton.setTitleColor(.white, for: .normal)
        viewMapButton.layer.cornerRadius = 5
        viewMapButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        
        viewMapButton.setGradientBackground(colorOne: Colors.darkGrey, colorTwo: Colors.green)
        view.setGradientBackground(colorOne: Colors.lightGrey, colorTwo: Colors.green)
        addTopAndBottomBorders()

    }

 
    @IBAction func viewMapButtonTapped(_ sender: Any) {
        if (UIApplication.shared.canOpenURL(NSURL(string:"http://maps.apple.com")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "http://maps.apple.com/?ll=37.718508810201115,-122.44325419736668")! as URL)
        } else {
          NSLog("Can't use Apple Maps");
        }
    }
    
    
    func addTopAndBottomBorders() {
       let thickness: CGFloat = 2.0
       let topBorder = CALayer()
       let bottomBorder = CALayer()
       let leftBorder = CALayer()
        let rightBorder = CALayer()
       topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.viewContainer.frame.size.width, height: thickness)
        leftBorder.frame = CGRect(x: 0.0, y: 0.0, width: thickness, height: self.viewContainer.frame.size.height - thickness)
        rightBorder.frame = CGRect(x: self.viewContainer.frame.size.width, y:0.0 , width: thickness, height: self.viewContainer.frame.size.height - thickness)
        rightBorder.backgroundColor = UIColor.lightGray.cgColor
        leftBorder.backgroundColor = UIColor.lightGray.cgColor
       topBorder.backgroundColor = UIColor.lightGray.cgColor
       bottomBorder.frame = CGRect(x:0, y: self.viewContainer.frame.size.height - thickness, width: self.viewContainer.frame.size.width, height:thickness)
       bottomBorder.backgroundColor = UIColor.lightGray.cgColor
       viewContainer.layer.addSublayer(topBorder)
       viewContainer.layer.addSublayer(rightBorder)
       viewContainer.layer.addSublayer(leftBorder)
       viewContainer.layer.addSublayer(bottomBorder)
    }
    
}

public extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

//
//  Office.swift
//  Ragnar
//
//  Created by Home on 11/9/20.
//  Copyright © 2020 Home. All rights reserved.
//

import MapKit
import UIKit

class Location: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
     init(title: String, coordinate: CLLocationCoordinate2D) {
           self.title = title
           self.coordinate = coordinate
       }
}

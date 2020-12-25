//
//  Product.swift
//  Ragnar
//
//  Created by Home on 10/16/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class Activity {
    var activityImage: UIImage
    var activityTitle: String
    var choice: String
    var activityName: String
    var atcivityTag: Int
    var information:String
    var locationTitle:String
    var latitude:Double
    var longtitude:Double
    
    init(productImage:UIImage, productTitle:String, brandName:String, productTypeName:String, tag:Int, information: String, locationTitle:String, latitude:Double, longtitude:Double) {
        self.activityImage = productImage
        self.activityTitle = productTitle
        self.choice = brandName
        self.activityName = productTypeName
        self.atcivityTag = tag
        self.information = information
        self.locationTitle = locationTitle
        self.latitude = latitude
        self.longtitude = longtitude
    }
}

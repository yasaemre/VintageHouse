//
//  BrandCell.swift
//  Ragnar
//
//  Created by Home on 10/9/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class ActivityCell: UITableViewCell {


    @IBOutlet var brandImageView: UIImageView!
    @IBOutlet var sloganLabel: UILabel!
    @IBOutlet weak var photosButton: UIButton!
    
    func setBrand(brand: Room) {
        brandImageView.image = brand.roomImage
        sloganLabel.text = brand.title
        photosButton.layer.cornerRadius = 5
        photosButton.contentHorizontalAlignment = .center
        photosButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
    }

}

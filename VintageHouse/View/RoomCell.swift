//
//  BrandCell.swift
//  Ragnar
//
//  Created by Home on 10/9/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class RoomCell: UITableViewCell {


    @IBOutlet var activityImageView: UIImageView!
    @IBOutlet var roomLabel: UILabel!
    @IBOutlet weak var photosButton: UIButton!
    
    func setActivity(brand: Room) {
        activityImageView.image = brand.roomImage
        roomLabel.text = brand.title
        photosButton.layer.cornerRadius = 5
        photosButton.contentHorizontalAlignment = .center
        photosButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
    }

}

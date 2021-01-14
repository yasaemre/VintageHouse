//
//  ProductCatalogCell.swift
//  Ragnar
//
//  Created by Home on 10/16/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class ActivityCatalogCell: UITableViewCell {

    @IBOutlet var activityImage: UIImageView!
    @IBOutlet var activityTitle: UILabel!
    
    @IBOutlet weak var viewActivityButton: UIButton!
    @IBOutlet var activityLabel: UILabel!
    @IBOutlet var placeTypeLabel: UILabel!
    @IBOutlet var staticPlaceLabel: UILabel!
    @IBOutlet var staticActivityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setActivityCell(product: Activity) {
        self.activityImage.image = product.activityImage
        self.activityTitle.text = product.activityTitle
        self.activityLabel.text = product.choice
        self.placeTypeLabel.text = product.activityName
        activityTitle.textColor =
          // 1
          UIColor { traitCollection in
            // 2
            switch traitCollection.userInterfaceStyle {
            case .dark:
              // 3
                return UIColor(red: 0, green: 0.4275, blue: 0.098, alpha: 1)
            default:
              // 4
                return UIColor(red: 0, green: 0.4, blue: 0.2902, alpha: 1)
            }
          }
        staticActivityLabel.textColor =
          // 1
          UIColor { traitCollection in
            // 2
            switch traitCollection.userInterfaceStyle {
            case .dark:
              // 3
                return UIColor(red: 0, green: 0.4275, blue: 0.098, alpha: 1)
            default:
              // 4
                return UIColor(red: 0, green: 0.4, blue: 0.2902, alpha: 1)
            }
          }
        staticPlaceLabel.textColor =
          // 1
          UIColor { traitCollection in
            // 2
            switch traitCollection.userInterfaceStyle {
            case .dark:
              // 3
                return UIColor(red: 0, green: 0.4275, blue: 0.098, alpha: 1)
            default:
              // 4
                return UIColor(red: 0, green: 0.4, blue: 0.2902, alpha: 1)
            }
          }

        
    
        activityTitle.numberOfLines = 0
        viewActivityButton.layer.cornerRadius = 12
        viewActivityButton.contentHorizontalAlignment = .center
        viewActivityButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        viewActivityButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        viewActivityButton.layer.masksToBounds = true

    }
   
}

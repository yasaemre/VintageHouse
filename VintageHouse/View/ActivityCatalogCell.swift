//
//  ProductCatalogCell.swift
//  Ragnar
//
//  Created by Home on 10/16/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class ActivityCatalogCell: UITableViewCell {

    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productTitle: UILabel!
    
    @IBOutlet weak var productViewButton: UIButton!
    @IBOutlet var brandLabel: UILabel!
    @IBOutlet var productTypeLabel: UILabel!
    @IBOutlet var staticProductTypeLabel: UILabel!
    @IBOutlet var staticBrandLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setProduct(product: Activity) {
        self.productImage.image = product.activityImage
        self.productTitle.text = product.activityTitle
        self.brandLabel.text = product.choice
        self.productTypeLabel.text = product.activityName
        productTitle.textColor =
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
        staticBrandLabel.textColor =
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
        staticProductTypeLabel.textColor =
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

        
    
        productTitle.numberOfLines = 0
        productViewButton.layer.cornerRadius = 12
        productViewButton.contentHorizontalAlignment = .center
        productViewButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        productViewButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        productViewButton.layer.masksToBounds = true

    }
   
}

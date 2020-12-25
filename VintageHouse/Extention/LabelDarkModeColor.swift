//
//  LabelDarkModeColor.swift
//  VintageHouse
//
//  Created by Emre Yasa on 12/11/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
extension UIColor {
    static func myColor() -> UIColor {
        if #available(iOS 13, *) {
            return UIColor.init { (trait) -> UIColor in
                // the color can be from your own color config struct as well.
                return trait.userInterfaceStyle == .dark ? UIColor.darkGray : UIColor.orange
            }
        }
        else { return UIColor.orange }
    }
}

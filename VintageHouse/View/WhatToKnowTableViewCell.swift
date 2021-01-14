//
//  WhatToKnowTableViewCell.swift
//  Ragnar
//
//  Created by Home on 10/14/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class WhatToKnowTableViewCell: UITableViewCell {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

//
//  WhatToKnowViewController.swift
//  Ragnar
//
//  Created by Home on 9/24/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

class HouseRulesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var contactUsButton: UIButton!
    var questionArray = ["Shoes", "Smoking/Vaping/420", "Parties", "Pets"]
    var answerArray = ["Please remove your shoes when inside in the designated shoe rack near the front door. Each rack is seperated by room color. We love that you can enjoy the adventures outside but keeping the place clean with help us provide a cleaner space for future guest.", "Absolutely no smoking is allowed inside of the house. California legislation prohibits smoking within 20 feet away of entrance, exits and windows.", "Absolutely not. We are located in quiet residential area. No outside guests(other than those accounted for on reservation) allowed.", "No pets are allowed on the property. We love cuddly animal however this is a quiet  neighborhood and we prefer if our guest can respect this."]
    
    
    var selectedIndex = -1
    var isCollapse = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        contactUsButton.layer.cornerRadius = 10
        contactUsButton.contentEdgeInsets = UIEdgeInsets(top: 8, left: 10, bottom: 8, right: 10)
        let button = UIButton()
              button.setImage(UIImage(named: "logoH"), for: .normal)
              navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
    }
    

}


extension HouseRulesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WhatToKnowCell") as! WhatToKnowTableViewCell
        cell.questionLabel.text = questionArray[indexPath.row]
        cell.answerLabel.text = answerArray[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.selectedIndex == indexPath.row && isCollapse == true {
            return 300
        } else {
            return 60
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if selectedIndex == indexPath.row {
            if self.isCollapse == false {
                self.isCollapse = true
            } else {
                self.isCollapse = false
            }
        } else {
            self.isCollapse = true
        }
        self.selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}

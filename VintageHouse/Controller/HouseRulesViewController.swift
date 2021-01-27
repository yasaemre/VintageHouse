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
    var questionArray = ["How to get the house?", "From the airport", "How to get downtown", "For the shopping district", "Street Parking", "Closest park:", "Closest Coffee Shop", "Bakery", "Shopping Mall", "List of Kitchen supplies"]
    var answerArray = ["Using public transit to get around is very easy.", "You can take BART: it is an efficient underground train system that stop in different parts of the city.  Get on the bart station at the airport.  It is about a 20 mins ride and get off at Balboa Park station.  Once you reach Balboa park, walk down hill towards San Jose Avenue for about 3 blocks.  You are at the home.", "The bart station is also a great way to get to downtown SF.", "get off at Powell station, financial district is Montgomery station and embarcedero is near the ferry building and fisherman’s wharf.","Sometimes there are parking space across the street from the house.  There are often open spaces on cayuga avenue which is one block away or restani street, which is a one way street.", "Cayuga park is a neighborhood park which is around 10 mins by walk and is located at the end of cayuga avenue.  Cayuga park is known for the hand craved statues along the side of the park.  Dolores park is another near mission where lots of people gather", "Nameless tea & coffee located on 2 blocks away- 981 Geneva Avenue Philz Coffee on ocean avenue- 1110 Ocean Avenue Java House on Ocean Avenue- 1700 Ocean Avenue If you are not a fan of coffee, give boba milktea a try.  It’s very popular in San Francisco", "Ambrosia- 2605 Ocean Avenue…..this is my favorite bakery Geneva Bakery- 959 Geneva Avenue, local Chinese bakery within walking distance.  Must try their Egg tarts.", "By car: stonestown shopping center is the closest mall ~s10 mins drive By public transit: taking BART via downtown, Westfield center is the most convienient ~20 mins", "pots and pan, toaster, electric kettle, ninja chopper, rice cooker,blender"]
    
    
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

//
//  MenuController.swift
//  Ragnar
//
//  Created by Emre Yasa on 9/22/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home, rooms, whatToKnow, ourCompany, ourLocations, contactUs
}

class MenuViewController: UITableViewController {

    // MARK: - Properties
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNextItem(_:)))


        leftSwipe.direction = .left

        view.addGestureRecognizer(leftSwipe)

    }
    @objc func moveToNextItem(_ sender:UISwipeGestureRecognizer) {

       switch sender.direction{
        case .left:
             //left swipe action
            dismiss(animated: true) { [weak self] in

            }
       default: break //default
        }

    }
    //MARK: - Handlers
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else { return }
        switch menuType {
        case .rooms:
            guard let brandsVC = storyboard?.instantiateViewController(withIdentifier: "brandVC") as? RoomsViewController else { return }
            present(brandsVC, animated: true)
        case .whatToKnow:
            guard let whatToVC = storyboard?.instantiateViewController(withIdentifier: "whatToKnowVC") as? HouseRulesViewController else { return }
            present(whatToVC, animated: true)
        case .ourCompany:
            guard let companyVC = storyboard?.instantiateViewController(withIdentifier: "companyVC") as? VintageHouseViewController else { return }
            present(companyVC, animated: true)
        case .ourLocations:
            guard let locationVC = storyboard?.instantiateViewController(withIdentifier: "locationVC") as? HouseLocationViewController else { return }
           present(locationVC, animated: true)
        case .contactUs:
            guard let contactVC = storyboard?.instantiateViewController(withIdentifier: "contactVC") as? ContactViewController else { return }
            present(contactVC, animated: true)
            
        default:
            dismiss(animated: true) { [weak self] in

            }
            
        }
    }
    
}

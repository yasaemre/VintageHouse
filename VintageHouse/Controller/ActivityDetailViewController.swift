//
//  ProductDetailViewController.swift
//  Ragnar
//
//  Created by Home on 10/20/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import MessageUI
import MapKit

class ActivityDetailViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate, MKMapViewDelegate {


    @IBOutlet var imageView: UIImageView!
    @IBOutlet var activityType: UILabel!
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var placeNameLabel: UILabel!
    @IBOutlet weak var informationTextView: UITextView!
    
    @IBOutlet weak var mapView: MKMapView!
    var image = UIImage()
    var activityTitleLbl = ""
    var activityTypeLbl = ""
    var choiceNameLbl = ""
    var informationText = ""
    var activities: Activity?
    var locationTitle = ""
    var locationLatitude:Double = 0.0
    var locationLongtitude:Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.setImage(UIImage(named: "logoH"), for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem?.title = "Back"
        imageView.image = image
        activityType.text = "\(activityTitleLbl)"
        placeLabel.text = "\(activityTypeLbl)"
        placeNameLabel.text = "\(choiceNameLbl)"
        informationTextView.attributedText = attributedText()
        let centerLoc = CLLocation(latitude: locationLatitude, longitude: locationLongtitude)
        let locationAnnotation = Location(title: "\(locationTitle)", coordinate: CLLocationCoordinate2D(latitude: locationLatitude, longitude: locationLongtitude))
        mapView.centerToLocation(centerLoc)
        mapView.addAnnotation(locationAnnotation)
        mapView.delegate = self
        mapView.layer.masksToBounds = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(triggerTouchAction))
        mapView.addGestureRecognizer(gestureRecognizer)
    
    }
    @objc func triggerTouchAction(gestureReconizer: UITapGestureRecognizer) {
        if (UIApplication.shared.canOpenURL(NSURL(string:"http://maps.apple.com")! as URL)) {
            UIApplication.shared.openURL(NSURL(string:
                "http://maps.apple.com/?ll=\(locationLatitude),\(locationLongtitude)")! as URL)
        } else {
          NSLog("Can't use Apple Maps");
        }    }
    
    func attributedText() -> NSAttributedString {

        let string = "\(informationText)" as NSString
        
        let attributedString = NSMutableAttributedString(string: string as String, attributes: [.font:UIFont(name: "GillSans", size: 15), .foregroundColor:UIColor.label])

        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15.0)]
        
        

        // Part of string to be bold
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Address:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Total length:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Construction started:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Height:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Opened:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Hours:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Location:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Architectural style:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Restaurants"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Architect:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Designers:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Visitors:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Capacity:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Team:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Owner:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Phone:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Elevation:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Function:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Built:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Named for:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Built:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Tony’s Pizza Napoletana"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "A16"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Golden Boy Pizza"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Tommaso's Ristorante Italiano"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Daigo Sushi"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Ebisu Restaurant"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Kaisen Don"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Kin Kho"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Marnee Thai"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Farmhouse Kitchen"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "A La Turca"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Tuba"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Customer service:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Parent organization:"))
        attributedString.addAttributes(boldFontAttribute, range: string.range(of: "Population:"))
        

        // 4
        return attributedString
    }

//    @IBAction func emailButtonTapped(_ sender: Any) {
//        if MFMailComposeViewController.canSendMail() {
//                   let mail = MFMailComposeViewController()
//                   mail.mailComposeDelegate = self
//                   mail.setToRecipients(["eva.eng@gmail.com"])
//                   mail.setMessageBody("<p>Awesome tutorial!</p>", isHTML: true)
//
//                   present(mail, animated: true)
//               }
//    }
    @IBAction func callButtonTapped(_ sender: Any) {
        print("Call button tapped, but not working on Simulator.")
        //Text Message
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Message Body"
            controller.recipients = ["4151231234"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
        
        //Phone Call
//        guard let number = URL(string: "tel://" + "4151231234") else { return }
//        UIApplication.shared.open(number)
        
//        if let phoneCallURL = URL(string: "tel:// 4151231234") {
//          let application:UIApplication = UIApplication.shared
//          if (application.canOpenURL(phoneCallURL)) {
//              application.open(phoneCallURL, options: [:], completionHandler: nil)
//          }
//        }
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

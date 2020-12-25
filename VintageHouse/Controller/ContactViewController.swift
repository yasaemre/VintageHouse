//
//  ContactViewController.swift
//  Ragnar
//
//  Created by Home on 9/24/20.
//  Copyright © 2020 Home. All rights reserved.
//

import UIKit
import MessageUI

class ContactViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        
    }
    
// Brand new branch needs editing add .
    //This VC will be editted in couple of days
    // I will work on this page
    //Branc test
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.setGradientBackground(colorOne: Colors.white, colorTwo: Colors.green)
    }
    @IBAction func textButtonTapped(_ sender: Any) {
        //Text Message
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = "Message Body"
            controller.recipients = ["4151231234"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
    }
        func callButtonTapped(_ sender: Any) {
        //Phone Call
        guard let number = URL(string: "tel://" + "4151231234") else { return }
        UIApplication.shared.open(number)
        
        if let phoneCallURL = URL(string: "tel:// 4151231234") {
          let application:UIApplication = UIApplication.shared
          if (application.canOpenURL(phoneCallURL)) {
              application.open(phoneCallURL, options: [:], completionHandler: nil)
         }
    }
    }
        func emailButtonTapped(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["eva.eng@gmail.com"])
            mail.setMessageBody("<p>Awesome tutorial!</p>", isHTML: true)
            
            present(mail, animated: true)
        }
    
}

            func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
                controller.dismiss(animated: true)
            }
            func messageComposeViewController(_ controller: MFMessageComposeViewController!, didFinishWith result: MessageComposeResult) {
                self.dismiss(animated: true, completion: nil)
            }
        }
}

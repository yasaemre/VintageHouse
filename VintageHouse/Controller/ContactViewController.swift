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
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        textButton.layer.cornerRadius = 12
        textButton.layer.masksToBounds = true
        textButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        
   
        
        emailButton.layer.cornerRadius = 12
        emailButton.layer.masksToBounds = true
        emailButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.setGradientBackground(colorOne: Colors.white, colorTwo: Colors.green)
    }
    fileprivate func animateView(_ viewToAnimate:UIView) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn) {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.92, y: 0.92)
        } completion: { (_) in
            print("animate complete")
        }

    }
    @IBAction func textButtonTapped(_ sender: Any) {
        //Text Message
                self.animateView(sender as! UIView)
                
                let composeVC = MFMessageComposeViewController()
                composeVC.messageComposeDelegate = self
                
                //Configure the fields of the interface
                composeVC.recipients = ["4153368550"]
                composeVC.body = "Hi Eva, This is ..."
                
                if MFMessageComposeViewController.canSendText() {
                    self.present(composeVC, animated: true, completion: nil)
                } else {
                    print("Can't send messages.")
                }
    }
    

    @IBAction func emailButtonTapped(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["eva.eng@gmail.com"])
            mail.setMessageBody("<p>Hi Eva, This is...</p>", isHTML: true)
            
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


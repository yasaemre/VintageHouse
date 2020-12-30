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
    
    
//dsfdsfdsfdsgfhgfhfh

    @IBOutlet weak var emailEmreButton: UIButton!
    @IBOutlet weak var textEmreButton: UIButton!
    @IBOutlet weak var callEmreButton: UIButton!
    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        textButton.layer.cornerRadius = 12
        textButton.layer.masksToBounds = true
        textButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        
        textEmreButton.layer.cornerRadius = 12
        textEmreButton.layer.masksToBounds = true
        textEmreButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        
        callButton.layer.cornerRadius = 12
        callButton.layer.masksToBounds = true
        callButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        
        callEmreButton.layer.cornerRadius = 12
        callEmreButton.layer.masksToBounds = true
        callEmreButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        
        emailButton.layer.cornerRadius = 12
        emailButton.layer.masksToBounds = true
        emailButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        
        emailEmreButton.layer.cornerRadius = 12
        emailEmreButton.layer.masksToBounds = true
        emailEmreButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
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
                composeVC.recipients = ["7074004683"]
                composeVC.body = "Hi Eva, This is ..."
                
                if MFMessageComposeViewController.canSendText() {
                    self.present(composeVC, animated: true, completion: nil)
                } else {
                    print("Can't send messages.")
                }
    }
    @IBAction func textEmreButtonTapped(_ sender: Any) {
        //Text Message
                self.animateView(sender as! UIView)
                
                let composeVC = MFMessageComposeViewController()
                composeVC.messageComposeDelegate = self
                
                //Configure the fields of the interface
                composeVC.recipients = ["4159964734"]
                composeVC.body = "Hi Emre, This is ..."
                
                if MFMessageComposeViewController.canSendText() {
                    self.present(composeVC, animated: true, completion: nil)
                } else {
                    print("Can't send messages.")
                }
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
        if let phoneURL = NSURL(string: ("tel://" + "7074004683")) {
            
            let alert = UIAlertController(title: ("Call " + "7074004683" + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    @IBAction func callEmreButtonTapped(_ sender: Any) {
        if let phoneURL = NSURL(string: ("tel://" + "4159964734")) {
            
            let alert = UIAlertController(title: ("Call " + "4159964734" + "?"), message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Call", style: .default, handler: { (action) in
                UIApplication.shared.open(phoneURL as URL, options: [:], completionHandler: nil)
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }

    }
    @IBAction func emailEmreButtonTapped(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["emreyasa86@gmail.com"])
            mail.setMessageBody("<p>Hi Emre, This ...</p>", isHTML: true)
            
            present(mail, animated: true)
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


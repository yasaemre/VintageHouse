//
//  BookViewController.swift
//  VintageHouse
//
//  Created by Emre Yasa on 1/26/21.
//  Copyright © 2021 Home. All rights reserved.
//

import UIKit
import MessageUI

class BookViewController: UIViewController, MFMailComposeViewControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    var keyboardAdjusted = false
    var lastKeyboardOffset: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameTextField.delegate = self
        self.phoneTextField.delegate = self
        self.emailTextField.delegate = self
        self.messageTextField.delegate = self

        submitButton.layer.masksToBounds = true
        submitButton.layer.cornerRadius = submitButton.frame.height / 2
        submitButton.setGradientBackground(colorOne: Colors.veryDarkGrey, colorTwo: Colors.green)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if keyboardAdjusted == false {
            lastKeyboardOffset = getKeyboardHeight(notification: notification)
            view.frame.origin.y -= lastKeyboardOffset
            keyboardAdjusted = true
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if keyboardAdjusted == true {
            view.frame.origin.y += lastKeyboardOffset
            keyboardAdjusted = false
        }
    }

    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           self.view.endEditing(true)
       }

       // user presses return key

       func textFieldShouldReturn(_ textField: UITextField) -> Bool {
           textField.resignFirstResponder()
           return true
       }
    @IBAction func submitButtonTapped(_ sender: Any) {
        let dateFormatter = DateFormatter()

           dateFormatter.dateStyle = DateFormatter.Style.short
           dateFormatter.timeStyle = DateFormatter.Style.short
        let startDate = dateFormatter.string(from: startDatePicker.date)
        let endtDate = dateFormatter.string(from: endDatePicker.date)
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setSubject("Booking")
            mail.setToRecipients(["eva.eng@gmail.com"])
            mail.setMessageBody("<p>Name: \(nameTextField.text ?? "No Name")</p><p>Phone: \(phoneTextField.text ?? "No Phone")</p><p>Email:\(emailTextField.text ?? "No email")</p><p>Starting from: \(startDate)</p><p>Ends at: \(endtDate)</p><p>Mesage: \(messageTextField.text ?? "No message")</p>", isHTML: true)
            
            present(mail, animated: true)
        }
    }
    


}

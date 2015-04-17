//
//  DetailViewController.swift
//  Contacts
//
//  Created by Aaron Ackerman on 4/16/15.
//  Copyright (c) 2015 Aaron Ackerman. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    

    @IBOutlet var nameField: UITextField!
    @IBOutlet var phoneNumberField: UITextField!
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.delegate = self
        self.phoneNumberField.delegate = self

        if let contact = self.contact {
            if let name = contact.name {
                self.nameField.text = name
            }
            if let phoneNumber = contact.phoneNumber {
                self.phoneNumberField.text = phoneNumber
            }
        }
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if textField == self.nameField {
            self.contact?.name = textField.text
        } else if textField == self.phoneNumberField {
            self.contact?.phoneNumber == textField.text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}

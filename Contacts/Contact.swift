//
//  Contact.swift
//  Contacts
//
//  Created by Aaron Ackerman on 4/14/15.
//  Copyright (c) 2015 Aaron Ackerman. All rights reserved.
//

import Foundation

class Contact {
    
    var name: String?
    var phoneNumber: String?
    
    init(name:String? = nil, phoneNumber:String? = nil) {
        self.name = name
        self.phoneNumber = phoneNumber
    }
}
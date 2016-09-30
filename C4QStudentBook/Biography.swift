//
//  Person.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/29/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import Foundation

class Biography {
    let firstName: String
    let lastName: String
    let profileImageName: String
    let email: String

    init(fullName: String, imageName: String, emailString: String) {
        let name = fullName.components(separatedBy: " ")
        if let firstN = name.first {
            firstName = firstN
        } else {
            firstName = ""
        }

        if let lastN = name.last {
            lastName = lastN
        } else {
            lastName = ""
        }
        email = emailString
        profileImageName = imageName
    }
}

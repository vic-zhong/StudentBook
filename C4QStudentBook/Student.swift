//
//  Student.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/29/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import Foundation

class Student {
    let personalInfo: Biography
    let id: Int
    let linkedin: String
    let github: String
    let funFact: String

    init(info: [String: Any], studentID: Int, linkedinAcc: String, githubAcc: String, fact: String) {
        id = studentID
        linkedin = linkedinAcc
        github = githubAcc
        funFact = fact
        if let fullName = info["fullName"] as? String, let imageName = info["imageName"] as? String, let email = info["email"] as? String {
            personalInfo = Biography(fullName: fullName, imageName: imageName, emailString: email)
        } else {
            personalInfo = Biography(fullName: "N/A", imageName: "c4q_logo", emailString: "N/A")
        }
    }
}

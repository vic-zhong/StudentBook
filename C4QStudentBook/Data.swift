//
//  Data.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/29/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import Foundation

class Data {
    class func fetchAllStudentsExcept(currentUser: Student?) -> [Student] {
        var students = [Student]()
        for studentDict in ac32_students {
            guard let bioInfo = studentDict["info"] as? [String: Any], let id = studentDict["studentID"] as? Int, let githubAcc = studentDict["github"] as? String, let fact = studentDict["funFact"] as? String, let linkedin = studentDict["linkedin"] as? String  else { continue }
            let student = Student(info: bioInfo, studentID: id, linkedinAcc: linkedin, githubAcc: githubAcc, fact: fact)
            if currentUser == nil {
                students.append(student)
            }
            guard let currentUser = currentUser else { continue }
            if student.personalInfo.email != currentUser.personalInfo.email {
                students.append(student)
            }
        }
        return students
    }
}


public var ac32_students: [[String: Any]] = [
    [
        "info": [
            "fullName": "Jason Wang",
            "email":"qwang216@gmail.com",
            "imageName": "jason",
        ],
        "studentID": 3200,
        "github": "qwang216",
        "linkedin": "jasonqwang",
        "funFact": "I code for food"
    ],
    [
        "info": [
            "fullName": "Amber Spadafora",
            "imageName": "amber_spadafora",
            "email":"ahspadafora@gmail.com",
        ],
        "studentID": 3201,
        "github": "defintuition",
        "funFact": "My name is Amber, I am 23 and from New York. I joined Access Code because I would like to begin a career in programming. Two fun facts about me are that I have lived in Cali and I create wire- wrapped crystal jewelry.",
        "linkedin": "amberspadafora"
    ],
    [
        "info": [
            "fullName": "Ana Ma",
            "imageName": "anna_ma",
            "email":"anama118118@gmail.com"
        ],
        "studentID": 3202,
        "github": "anama118118",
        "linkedin": "ana-ma-39294474",
        "funFact": "I joined Access Code in hopes to improve my knowledge in computer programing and software development. I would like to become a computer language literate who has an impact in forming a better tomorrow. My passion is turning my ideas and thoughts into functional objects and functional processes. I keep planners with me all the time in order to keep my life more organized and functional."
    ],
    [
        "info": [
            "fullName": "Annie Tung",
            "imageName": "annie_tung",
            "email":"annie.mmt@gmail.com"
        ],
        "studentID": 3203,
        "github": "amtung",
        "linkedin": "tungannie",
        "funFact": "I joined Access Code because I want to develop my passion for coding. I want to combine my visual and artistic skills with new programming skills and be able to build things to reality. Coding seems interesting and challenging but I really want to see how far I can push myself, I’m ready to tackle the next 10 months. Fun fact, I have 2 adorable bunnies and it was just their birthdays few days ago! I have been playing the piano since I was 4 but stopped before College, recently I’m picking it up again and trying to play some electronic dance music into classical music pieces."
    ],
    [
        "info": [
            "fullName": "Cristopher Chavez",
            "imageName": "cristopher_chavez",
            "email":"CristopherChavezNY@gmail.com"
        ],
        "studentID": 3204,
        "github": "cristopherchavezny",
        "linkedin": "cristopher-chavez-6693b965",
        "funFact": "My name is Christopher, originally from Mexico and up until three years ago I was undocumented. I haven’t had a linear path towards my career in tech but I am looking forward to Access Code and all the resources they are o ering us to jump start a better future for myself and my family. I am an avid cyclist with a passion for social justice."
    ],
    [
        "info": [
            "fullName": "Eashir Arafat",
            "imageName": "eashir_arafat",
            "email":"eashir.arafat@gmail.com"
        ],
        "studentID": 3205,
        "github": "eashir",
        "linkedin": "EashirArafat",
        "funFact": "Simply put, I’m an animator who wants to acquire programming skills in order to be a better well-rounded individual. Animating, programming, and streaming; my dream is to live a life that incorporates these three key aspects."
    ],
    [
        "info": [
            "fullName": "Edward Anchundia",
            "imageName": "edward_anchundia",
            "email":"edward.anchundia@gmail.com"
        ],
        "studentID": 3206,
        "github": "edwardanchundia",
        "linkedin": "edwardanchundia",
        "funFact": "I am one of four brothers in an Ecuadorian family. I’ve had an interest in coding for sometime now and realized that I work best in a classroom setting with a curriculum which is why I joined Access Code. I am a drummer, photographer, fast driver and many more. I hope to not only meet new people but to also exchange ideas and bring solutions to world issues using technology."
    ]
]

//
//  LogInViewController.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/29/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    var data: Data?

    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 60
        imageView.layer.masksToBounds = true
        logInButton.addTarget(self, action: #selector(handleLogInButton), for: .touchUpInside)
        data = Data(studentsDict: ac32_students, user: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = nil
        passwordTextField.text = nil
    }

    func handleLogInButton() {
        guard let emailEntered = emailTextField.text, let pwEntered = passwordTextField.text, let currentStudent = data?.students.filter({ $0.personalInfo.email.lowercased() == emailEntered.lowercased() }).first else {
            displayAlertWith(message: "Invalid Entry email/password")
            return
        }

        if pwEntered == String(currentStudent.id) {
            guard let students = data?.students.filter({ $0.personalInfo.email.lowercased() != currentStudent.personalInfo.email.lowercased() }) else { return }
            data?.students = students
            data?.currentUser = currentStudent
            performSegue(withIdentifier: "studentsListSegueID", sender: data)
        } else {
            displayAlertWith(message: "Invalid password")
        }
    }

    func displayAlertWith(message: String) {
        let alert = UIAlertController(title: "Login Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "studentsListSegueID" {
            guard let studentsData = sender as? Data else { return }
            let navController = segue.destination as! UINavigationController
            let studentsTVC = navController.topViewController as! StudentsTableViewController
            studentsTVC.data = studentsData

        }
    }

}

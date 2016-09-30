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

    var students = [Student]()
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
        navigationController?.navigationBar.isHidden = true
    }

    func handleLogInButton() {
        guard let emailEntered = emailTextField.text, let pwEntered = passwordTextField.text else {
            displayAlertWith(message: "Please enter both email and password field")
            return
        }
        guard let students = data?.students else { return }
        guard let student = students.filter({ $0.personalInfo.email.lowercased() == emailEntered.lowercased() }).first else {
            displayAlertWith(message: "Invalid Entry")
            return
        }

        if pwEntered == String(student.id) {
            performSegue(withIdentifier: "studentsListSegueID", sender: student)
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
            let navController = segue.destination as! UINavigationController
            let studentsTVC = navController.topViewController as! StudentsTableViewController
            studentsTVC.currentUser = sender as? Student
        }
    }

}

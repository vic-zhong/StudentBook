//
//  DetailViewController.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/29/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var studentIDLabel: UILabel!
    @IBOutlet weak var funFactTextView: UITextView!
    @IBOutlet weak var closeButton: UIButton!

    var linkedURLString: String?
    var githubURLString: String?
    var student: Student?

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.layer.cornerRadius = 100
        profileImageView.layer.masksToBounds = true
        if self.navigationController != nil {
            closeButton.isHidden = true
        }
        setupData()
    }

    func setupData() {
        guard let studentInfo = student else { return }
        navigationItem.title = studentInfo.personalInfo.firstName + " " + studentInfo.personalInfo.lastName
        emailLabel.text = "Email: " + studentInfo.personalInfo.email
        studentIDLabel.text = "Student ID: " + String(describing: studentInfo.id)
        funFactTextView.text = "Fun Fact: " + studentInfo.funFact
        profileImageView.image = UIImage(named: studentInfo.personalInfo.profileImageName)
        linkedURLString = "https://www.linkedin.com/in/\(studentInfo.linkedin)"
        githubURLString = "https://github.com/\(studentInfo.github)"
    }

    @IBAction func handleLinkedinButton(sender: UIButton) {
        guard let urlString = linkedURLString else { return }
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    @IBAction func handleGitHubButton(sender: UIButton) {
        guard let urlString = githubURLString else { return }
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    @IBAction func closeButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

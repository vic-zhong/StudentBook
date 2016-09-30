//
//  StudentsTableViewController.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/29/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {

    var currentUser: Student!
    var students = [Student]()

    @IBOutlet weak var titleImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var titleView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        students = Data.fetchAllStudentsExcept(currentUser: currentUser)
        setupNavBar()
    }

    func sortStudentsBy(condition: String, ascending: Bool) {
        students.sort { (currentStudent, nextStudent) -> Bool in
            if ascending {
                switch condition {
                case "firstName":
                    return currentStudent.personalInfo.firstName < nextStudent.personalInfo.firstName
                case "lastName":
                    return currentStudent.personalInfo.lastName < nextStudent.personalInfo.lastName
                case "email":
                    return currentStudent.personalInfo.email < nextStudent.personalInfo.email
                default:
                    return currentStudent.id < nextStudent.id
                }
            } else {
                switch condition {
                case "firstName":
                    return currentStudent.personalInfo.firstName > nextStudent.personalInfo.firstName
                case "lastName":
                    return currentStudent.personalInfo.lastName > nextStudent.personalInfo.lastName
                case "email":
                    return currentStudent.personalInfo.email > nextStudent.personalInfo.email
                default:
                    return currentStudent.id > nextStudent.id
                }
            }
        }
        tableView.reloadData()
    }

//    func sortStudentsBy(condition: String, ascending: Bool) {
//        students.sort { (currentStudent, nextStudent) -> Bool in
//         //   if ascending {
//                switch condition {
//                case "firstName":
//                    return ascending ? (currentStudent.personalInfo.firstName < nextStudent.personalInfo.firstName)
//                case "lastName":
//                    return currentStudent.personalInfo.lastName < nextStudent.personalInfo.lastName
//                case "email":
//                    return currentStudent.personalInfo.email < nextStudent.personalInfo.email
//                default:
//                    return currentStudent.id < nextStudent.id
//                }
////            }
//        }
//        tableView.reloadData()
//    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false

//        students.sort {(a, b) in
//            return a.personalInfo.lastName + a.personalInfo.firstName < b.personalInfo.firstName
//        }
    }

    func setupNavBar() {
        titleImageView.image = UIImage(named: currentUser.personalInfo.profileImageName)
        titleImageView.layer.cornerRadius = 20
        titleImageView.layer.masksToBounds = true
        let currentUserInfo = currentUser.personalInfo
        titleLabel.text = currentUserInfo.firstName + " " + currentUserInfo.lastName
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTitleViewTap))
        titleView.addGestureRecognizer(tapGesture)
    }

    func handleTitleViewTap() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.student = currentUser
//        let navController = UINavigationController(rootViewController: detailVC)
//        let leftButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleLeftBarButton))
//        navController.navigationItem.leftBarButtonItem = leftButton
//        navigationController?.present(detailVC, animated: true, completion: nil)
        present(detailVC, animated: true, completion: nil)
//        performSegue(withIdentifier: "detailVCSegueID", sender: currentUser)
    }

    func handleLeftBarButton() {

    }

    @IBAction func handleProfileButton(_ sender: UIBarButtonItem) {

    }

    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCellID", for: indexPath) as! StudentTableViewCell
        cell.selectionStyle = .none
        let studentInfo = students[indexPath.row].personalInfo
        cell.studentInfo = studentInfo
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = students[indexPath.row]
        performSegue(withIdentifier: "detailVCSegueID", sender: student)
    }


    // MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVCSegueID" {
            let detailVC = segue.destination as? DetailViewController
            detailVC?.student = sender as? Student
        }
    }


}

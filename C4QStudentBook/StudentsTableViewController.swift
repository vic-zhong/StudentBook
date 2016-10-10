//
//  StudentsTableViewController.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/29/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController, FilterStudentDelegate {

    var data: Data!

    @IBOutlet weak var titleImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var titleView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tableView.reloadData()
    }

    func filterStudentBy(condition: String) {
        data.sortStudentsBy(condition: condition, ascending: true)
    }

    func setupNavBar() {
        guard let currentUser = data.currentUser else { return }
        titleImageView.image = UIImage(named: currentUser.personalInfo.profileImageName)
        titleImageView.layer.cornerRadius = 20
        titleImageView.layer.masksToBounds = true
        let currentUserInfo = currentUser.personalInfo
        titleLabel.text = currentUserInfo.firstName + " " + currentUserInfo.lastName
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTitleViewTap))
        titleView.addGestureRecognizer(tapGesture)
    }

    // MARK: - Button Actions

    func handleTitleViewTap() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailVC.student = data.currentUser
        present(detailVC, animated: true, completion: nil)
    }

    @IBAction func handleFilterButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "filterVCSegueID", sender: nil)
    }


    @IBAction func logoutButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCellID", for: indexPath) as! StudentTableViewCell
        cell.selectionStyle = .none
        let studentInfo = data.students[indexPath.row].personalInfo
        cell.studentInfo = studentInfo
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let student = data.students[indexPath.row]
        performSegue(withIdentifier: "detailVCSegueID", sender: student)
    }

    // MARK: - Prepare for Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailVCSegueID" {
            let detailVC = segue.destination as? DetailViewController
            detailVC?.student = sender as? Student
        } else if segue.identifier == "filterVCSegueID" {
            let filterVC = segue.destination as? FilterViewController
            filterVC?.delegate = self
        }
    }


}

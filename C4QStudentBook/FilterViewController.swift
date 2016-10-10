//
//  FilterViewController.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/30/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

protocol FilterStudentDelegate: class {
    func filterStudentBy(condition: String)
}

class FilterViewController: UIViewController {

    @IBOutlet weak var filterLabel: UILabel!

    var condition: String? {
        didSet {
            guard let condi = condition else { return }
            filterLabel.text = "Filter By: " + condi
        }
    }
    weak var delegate: FilterStudentDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func saveButtonTapped(_ sender: UIButton) {
        if let condi = condition {
            delegate?.filterStudentBy(condition: condi)
        }
        dismiss(animated: true, completion: nil)
    }

    @IBAction func firstNameButtonTapped(_ sender: AnyObject) {
        condition = "firstName"

    }

    @IBAction func lastNameButtonTapped(_ sender: AnyObject) {
        condition = "lastName"
    }



}

//
//  SelfDetailViewController.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/29/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class SelfDetailViewController: DetailViewController {
    @IBOutlet weak var closeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        closeButton.addTarget(self, action: #selector(handleClosedButton), for: .touchUpInside)
    }
    func handleClosedButton() {
        dismiss(animated: true, completion: nil)
    }
    
}

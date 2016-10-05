//
//  StudentTableViewCell.swift
//  C4QStudentBook
//
//  Created by Jason Wang on 9/29/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class StudentTableViewCell: UITableViewCell {

    @IBOutlet weak var pImageView: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!

    var studentInfo: Biography? {
        didSet {
            guard let stuInfo = studentInfo else { return }
            set(info: stuInfo)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        pImageView.layer.cornerRadius = 35
        pImageView.layer.masksToBounds = true
    }

    private func set(info: Biography) {
        pImageView.image = UIImage(named: info.profileImageName)
        fullNameLabel.text = "\(info.firstName) \(info.lastName)"
        emailLabel.text = info.email
    }

}

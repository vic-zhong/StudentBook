//
//  TourCell.swift
//  C4QStudentBook
//
//  Created by Victor Zhong on 11/18/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import Foundation
import UIKit

class TourCell: BaseCell {
 
    static let identifier = "tourCellID"
    
    // we need an imageView and a textView
    
    let imageView: UIImageView = {
        let image = UIImage(named: "c4q_logo")
        let iv = UIImageView(image: image)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let textView: UITextView = {
        let tv = UITextView()
        tv.backgroundColor = .white
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.text = "Jason is Awesome!!!"
        tv.isSelectable = false
        tv.isEditable = false
        return tv
    }()
    
    var tour: Tour? {
        didSet {
            guard let tourData = tour else { return }
            setup(tour: tourData)
        }
    }
    
    override func setupCell() {
        super.setupCell()
        addSubview(imageView)
        addSubview(textView)
        
        imageView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(0.6)).isActive = true
        
        textView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        textView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        textView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        textView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: CGFloat(0.25)).isActive = true
    }
    
    fileprivate func setup(tour: Tour) {
        imageView.image = UIImage(named: tour.imageString)
        //        textView.text = tour.title + "\n\n" + tour.description
        
        let attributedString = NSMutableAttributedString(string: tour.title, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 20, weight: UIFontWeightMedium)])
        let descriptionAttribute = NSMutableAttributedString(string: "\n\n" + tour.description, attributes: [NSForegroundColorAttributeName : UIColor.gray, NSFontAttributeName : UIFont.systemFont(ofSize: 15, weight: UIFontWeightLight)])
        attributedString.append(descriptionAttribute)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        let textLength = attributedString.string.characters.count
        let range = NSRange(location: 0, length: textLength)
        
        attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)
        
        textView.attributedText = attributedString
        
    }
}

//
//  LoginCell.swift
//  C4QStudentBook
//
//  Created by Victor Zhong on 11/18/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit


class LoginCell: BaseCell {
    
    static let identifier = "loginCellID"
    
    let emailTextField: UITextField = {
        let etf = UITextField()
        etf.translatesAutoresizingMaskIntoConstraints = false
        etf.placeholder = "Enter Email Address"
        etf.borderStyle = .roundedRect
        return etf
    }()
    
    let passwordTextField: UITextField = {
        let ptf = UITextField()
        ptf.translatesAutoresizingMaskIntoConstraints = false
        ptf.isSecureTextEntry = true
        ptf.placeholder = "Enter Password"
        ptf.borderStyle = .roundedRect
        return ptf
    }()
    
    lazy var loginButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        butt.backgroundColor = .orange
        butt.setTitleColor(.white, for: .normal)
        butt.setTitle("Login", for: .normal)
        return butt
    }()
    
    func loginButtonTapped() {
        print("Vic is an awesome passenger")
    }
    
    override func setupCell() {
        super.setupCell()
        backgroundColor = .white
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        emailTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        emailTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        emailTextField.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10).isActive = true
        loginButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        loginButton.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
}

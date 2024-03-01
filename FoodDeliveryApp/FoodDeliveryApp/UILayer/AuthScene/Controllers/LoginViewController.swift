//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 01.03.2024.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let bottonView = BottomView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        bottonView.button2Action = facebookPress
        bottonView.button1Action = googlePress
    }
    
    func facebookPress() {
        print("facebook")
    }
    func googlePress() {
        print("google")
    }
}

private extension LoginViewController {
    func setupLayout() {
        setupBottomViews()
    }
    
    func setupBottomViews() {
        view.addSubview(bottonView)
        bottonView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bottonView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            bottonView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            bottonView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            bottonView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

#Preview("LoginVC"){
    LoginViewController()
}

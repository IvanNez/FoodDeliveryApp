//
//  LoginViewController.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 01.03.2024.
//

import UIKit

enum LoginViewState {
    case initial
    case signIn
    case signUp
}

protocol LoginViewInput: AnyObject {
    func onSignInTapped()
    func onSignUpTapped()
    func onFacebookTapped()
    func onGoogleTapped()
    func onForgotTapped()
    func onBackPressed()
}

class LoginViewController: UIViewController {
    
    //MARK: - Property
    private var state: LoginViewState = .initial
    weak var viewOutput: LoginViewOutput!
    
    //MARK: - Views
    private lazy var bottonView = FDBottom()
    private lazy var textField = FDTextField()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    
    
    //MARK: - Initializes
    init(viewOutput: LoginViewOutput, state: LoginViewState) {
        self.viewOutput = viewOutput
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
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
        switch state {
        case .initial:
            setupBottomViews()
            setupLogoImage()
            setupSignInButton()
            setupSignUpButton()
        case .signIn:
            setupBottomViews()
            setupTextField()
        case .signUp:
            setupBottomViews()
            setupTextField()
        }
        
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
    
    func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 354)
            
            
        ])
    }
    
    func setupLogoImage() {
        view.addSubview(logoImage)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .appstore)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 109),
            logoImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 57),
            logoImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupSignInButton() {
        view.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign in")
        signInButton.scheme = .orange
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor,constant: 60),
            signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign up")
        signUpButton.scheme = .gray
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor,constant: 20),
            signUpButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        
    }
    
    func onSignUpTapped() {
        
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    
}

#Preview("LoginVC"){
    LoginViewController(viewOutput: LoginPresenter(), state: .initial)
}

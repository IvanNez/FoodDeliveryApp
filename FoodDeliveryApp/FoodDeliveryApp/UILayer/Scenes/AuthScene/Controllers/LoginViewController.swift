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
    var viewOutput: LoginViewOutput!
    
    //MARK: - Views
    private lazy var bottonView = FDBottom()
    private lazy var titleLabel = UILabel()
    private lazy var signInUserName = FDTextField()
    private lazy var signInPassword = FDTextField()
    private lazy var signUpUsername = FDTextField()
    private lazy var signUpPassword = FDTextField()
    private lazy var signUpReEnterPass = FDTextField()
    private lazy var forgotLabel = UILabel()
    private lazy var logoImage = UIImageView()
    private lazy var signInButton = FDButton()
    private lazy var signUpButton = FDButton()
    private lazy var verticalStack = UIStackView()
    
    
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

// MARK: - Layout
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
            setupStack()
            setupSignInPassword()
            setupSignInUserName()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        case .signUp:
            setupBottomViews()
            setupStack()
            setupSignUpPassword()
            setupSignUpUsername()
            setupSignUpReEnterPass()
            setupTitleLabel()
            setupSignInButton()
            setupForgotLabel()
        }
    }
    func setupStack() {
        view.addSubview(verticalStack)
        verticalStack.translatesAutoresizingMaskIntoConstraints = false
        verticalStack.axis = .vertical
        verticalStack.spacing = 20

        switch state {
        case .initial:
            return
        case .signIn:
            verticalStack.addArrangedSubview(signInUserName)
            verticalStack.addArrangedSubview(signInPassword)
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottonView.topAnchor,constant: -262)
            ])
        case .signUp:
            verticalStack.addArrangedSubview(signUpUsername)
            verticalStack.addArrangedSubview(signUpPassword)
            verticalStack.addArrangedSubview(signUpReEnterPass)
            NSLayoutConstraint.activate([
                verticalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                verticalStack.bottomAnchor.constraint(equalTo: bottonView.topAnchor,constant: -227)
            ])
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
    func setupSignInPassword() {
        signInPassword.translatesAutoresizingMaskIntoConstraints = false
        signInPassword.placeholder = "Password"
        NSLayoutConstraint.activate([
            signInPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignInUserName() {
        signInUserName.translatesAutoresizingMaskIntoConstraints = false
        signInUserName.placeholder = "Username"
        NSLayoutConstraint.activate([
            signInUserName.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signInUserName.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signInUserName.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupTitleLabel() {
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .Roboto.bold.size(of: 24)
        
        switch state{
        case .initial:
            break
        case .signIn:
            titleLabel.text = "Sign in"
        case .signUp:
            titleLabel.text = "Sign up"
        }
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: verticalStack.topAnchor, constant: -38),
            titleLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            titleLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupLogoImage() {
        view.addSubview(logoImage)
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        logoImage.image = UIImage(resource: .loginLogo)
        logoImage.layer.cornerRadius = 24
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 109),
            logoImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 57),
            logoImage.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -57),
            logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor)
        ])
    }
    func setupSignInButton() {
        view.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.setTitle("Sign in")
        signInButton.scheme = .orange
        
        signInButton.action = onSignInTapped
        
        switch state {
        case .initial :
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: self.logoImage.bottomAnchor,constant: 60),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signIn:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: verticalStack.bottomAnchor,constant: 30),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        case .signUp:
            NSLayoutConstraint.activate([
                signInButton.topAnchor.constraint(equalTo: self.verticalStack.bottomAnchor,constant: 30),
                signInButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
                signInButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
                signInButton.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
       
    }
    func setupSignUpButton() {
        view.addSubview(signUpButton)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitle("Sign up")
        signUpButton.scheme = .gray
        signUpButton.action = onSignUpTapped
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: self.signInButton.bottomAnchor,constant: 20),
            signUpButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupForgotLabel() {
        view.addSubview(forgotLabel)
        
        forgotLabel.translatesAutoresizingMaskIntoConstraints = false
        forgotLabel.text = "Forgot password?"
        forgotLabel.font = .Roboto.regular.size(of: 14)
        forgotLabel.textColor = AppColors.bottomViewGrey
        
        NSLayoutConstraint.activate([
            forgotLabel.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            forgotLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30)
        ])
    }
    func setupSignUpPassword() {
        signUpPassword.translatesAutoresizingMaskIntoConstraints = false
        signUpPassword.placeholder = "Enter password"
        
        NSLayoutConstraint.activate([
            signUpPassword.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpPassword.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30),
            signUpPassword.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpUsername() {
        signUpUsername.translatesAutoresizingMaskIntoConstraints = false
        signUpUsername.placeholder = "Enter username"
        
        NSLayoutConstraint.activate([
            signUpUsername.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpUsername.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -30),
            signUpUsername.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    func setupSignUpReEnterPass() {
        signUpReEnterPass.translatesAutoresizingMaskIntoConstraints = false
        signUpReEnterPass.placeholder = "Re-enter Password"
        
        NSLayoutConstraint.activate([
            signUpReEnterPass.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30),
            signUpReEnterPass.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: -30),
            signUpReEnterPass.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

// MARK: - LoginViewInput DELEGATE
extension LoginViewController: LoginViewInput {
    func onBackPressed() {
        
    }
    
    func onSignInTapped() {
        switch state{
        case .initial:
            viewOutput.goToSignIn()
        case .signIn:
            return
        case .signUp:
            return
            
        }
    }
    
    func onSignUpTapped() {
        switch state{
        case .initial:
            viewOutput.goToSignUp()
        case .signIn:
            return
        case .signUp:
            return
            
        }
    }
    
    func onFacebookTapped() {
        
    }
    
    func onGoogleTapped() {
        
    }
    
    func onForgotTapped() {
        
    }
    
    
}

//#Preview("LoginVC"){
//    LoginViewController(viewOutput: LoginPresenter(), state: .signUp)
//}

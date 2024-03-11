//
//  LoginViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 11.03.2024.
//

import Foundation

protocol LoginViewOutput: AnyObject {
    func loginStart()
    func registrationStart()
    func goToFacebookLogin()
    func goToGoogleLogin()
    func goToSignIn()
    func goToSignUp()
    func goToForgotPass()
    func back()
}

class LoginPresenter {
    
    private var coordinator: AppCoordinator?
    weak var viewInput:LoginViewInput?
    
    init(coordinator: AppCoordinator? = nil, viewInput: LoginViewInput? = nil) {
        self.coordinator = coordinator
        self.viewInput = viewInput
    }
    
    
    
}

extension LoginPresenter: LoginViewOutput {
    func loginStart() {
        
    }
    
    func registrationStart() {
        
    }
    
    func goToFacebookLogin() {
        
    }
    
    func goToGoogleLogin() {
        
    }
    
    func goToSignIn() {
        
    }
    
    func goToSignUp() {
        
    }
    
    func goToForgotPass() {
        
    }
    
    func back() {
        
    }
    
}

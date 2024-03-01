//
//  ObboardingViewPresenter.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 15.02.2024.
//

import Foundation

protocol OnboardingViewOutput: AnyObject {
    func onboardingFunish()
}

class OnboardingViewPresenter: OnboardingViewOutput {
    
    private let userStorage = UserStorage.shared
    
    // MARK: - Properties
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFunish() {
        userStorage.passedOnboarding = true
        coordinator.finish()
    }
}

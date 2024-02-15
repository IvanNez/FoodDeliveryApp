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
    
    // MARK: - Properties
    weak var coordinator: OnboardingCoordinator!
    
    init(coordinator: OnboardingCoordinator!) {
        self.coordinator = coordinator
    }
    
    func onboardingFunish() {
        coordinator.finish()
    }
}

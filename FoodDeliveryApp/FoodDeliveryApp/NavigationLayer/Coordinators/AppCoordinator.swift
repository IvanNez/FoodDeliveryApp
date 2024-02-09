//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 09.02.2024.
//

import UIKit

class AppCoordinator: Coordinator{
    
    override func start() {
        showOnboardingFlow()
    }
    
    override func finish() {
       print("AppCoordinator finish")
    }
    
}


// MARK: -- Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        let onboardingCoordinator = OnboardingCoordinator(type: .app, navigationController: navigationController, finishDelegate: self)
        addChildCoordinator(onboardingCoordinator)
        onboardingCoordinator.start()
    }
    
    func showMainFlow() {
        
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removerChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}

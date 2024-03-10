//
//  AppCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 09.02.2024.
//

import UIKit

class AppCoordinator: Coordinator{
    
    private let userStorage = UserStorage.shared
    private let factory = SceneFactory.self
    
    override func start() {
        showOnboardingFlow()
//        if userStorage.passedOnboarding{
//            showMainFlow()
//        } else {
//            showOnboardingFlow()
//        }
//       let loginVC = LoginViewController()
//        navigationController?.pushViewController(loginVC, animated: true)
        
    }
    
    override func finish() {
       print("AppCoordinator finish")
    }
    
}


// MARK: -- Navigation methods
private extension AppCoordinator {
    func showOnboardingFlow() {
        guard let navigationController = navigationController else { return }
        factory.makeOnboardingFlow(coordinator: self, finishDelegate: self, navigationController: navigationController)
    }
    
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator: self,finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinator: CoordinatorProtocol) {
        removerChildCoordinator(childCoordinator)
        
        switch childCoordinator.type {
        case .onboarding:
            navigationController?.viewControllers.removeAll()
            showMainFlow()
        case .app:
            return
        default:
            navigationController?.popViewController(animated: false)
        }
    }
}

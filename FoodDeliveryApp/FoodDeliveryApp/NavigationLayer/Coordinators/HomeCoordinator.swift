//
//  HomeCoordinator.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 09.02.2024.
//


import UIKit

class HomeCoordinator: Coordinator{
    
    private let factory = SceneFactory.self
    
    override func start() {
        showHomeScene()
    }
    
    override func finish() {
       print("AppCoordinator finish")
    }
    
}

// MARK: - Navigation
extension HomeCoordinator {
    func showHomeScene() {
        guard let navigationController = navigationController else { return }
        let vc = factory.makeHomeScreen(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
}

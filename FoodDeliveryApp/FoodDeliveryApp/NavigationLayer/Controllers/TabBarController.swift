//
//  TabBarController.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 09.02.2024.
//

import UIKit

class TabBarController: UITabBarController {
    
    
    
    init(tabBarControolers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        for tab in tabBarControolers {
            self.addChild(tab)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = AppColors.background
        tabBar.tintColor = AppColors.accentOrange
    }
}

//
//  SmallHCViewCell.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 09.04.2024.
//

import UIKit

class SmallHCViewCell: UICollectionViewCell {
    
    let topView = UIView()
    let bottomLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
   func setupCell() {
       contentView.backgroundColor = .blue
       setupTopView()
       setupBottomLabel()
    }
    func setupTopView() {
        contentView.addSubview(topView)
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .green
        topView.layer.cornerRadius = 20
        topView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            topView.widthAnchor.constraint(equalToConstant: 70),
            topView.heightAnchor.constraint(equalToConstant: 70),
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    func setupBottomLabel() {
        contentView.addSubview(bottomLabel)
        
        bottomLabel.font = .Roboto.regular.size(of: 14)
        bottomLabel.text = "test label"
        bottomLabel.textColor = .white
        
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
      
        NSLayoutConstraint.activate([
            bottomLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 5),
            bottomLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
}

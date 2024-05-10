//
//  BigVCViewCell.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 10.05.2024.
//

import UIKit

class BigVCViewCell: UICollectionViewCell {
    
    let topView = UIView()
    let titleLabel = UILabel()
    
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
            topView.widthAnchor.constraint(equalToConstant: 130),
            topView.heightAnchor.constraint(equalToConstant: 130),
            topView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            topView.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
    }
    func setupBottomLabel() {
        contentView.addSubview(titleLabel)
        
        titleLabel.font = .Roboto.regular.size(of: 14)
        titleLabel.text = "Title label"
        titleLabel.textColor = .black
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: topView.leftAnchor, constant: 15)
        ])
    }
}

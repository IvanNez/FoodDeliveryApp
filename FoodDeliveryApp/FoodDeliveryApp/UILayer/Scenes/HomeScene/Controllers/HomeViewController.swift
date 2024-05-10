//
//  HomeViewController.swift
//  FoodDeliveryApp
//
//  Created by Иван Незговоров on 09.04.2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    lazy var smallHCollection: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        layot.scrollDirection = .horizontal
        layot.minimumLineSpacing = 40
        layot.minimumInteritemSpacing = 0
        layot.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layot)
        collection.tag = 1
        return collection
    }()
    
    lazy var bigHCollection: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        layot.scrollDirection = .horizontal
        layot.minimumLineSpacing = 20
        layot.minimumInteritemSpacing = 20
        layot.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layot)
        collection.tag = 2
        return collection
    }()
    
    lazy var bigVCollection: UICollectionView = {
        let layot = UICollectionViewFlowLayout()
        layot.scrollDirection = .vertical
        layot.minimumLineSpacing = 20
        layot.minimumInteritemSpacing = 20
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layot)
        collection.tag = 3
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

// MARK: -- Layout
extension HomeViewController {
    func setupLayout() {
        setupView()
        configureScrollView()
        configureContentView()
        prepareScrollView()
        setupSmallHCollection()
        setupBigHCollection()
        setupBigVCollection()
    }
    
    func setupView() {
        view.backgroundColor = .white
    }
    
    func configureScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.alwaysBounceVertical = true
        scrollView.backgroundColor = .brown
    }
    
    func configureContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .systemMint
    }
    
    func prepareScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
    }
    
    func setupSmallHCollection() {
        contentView.addSubview(smallHCollection)
        
        smallHCollection.backgroundColor = .red
        smallHCollection.translatesAutoresizingMaskIntoConstraints = false
        smallHCollection.delegate = self
        smallHCollection.dataSource = self
        smallHCollection.register(SmallHCViewCell.self, forCellWithReuseIdentifier: "SmallHCViewCell")
        
        NSLayoutConstraint.activate([
            smallHCollection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            smallHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            smallHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            smallHCollection.heightAnchor.constraint(equalToConstant: 91)
        ])
    }
    
    func setupBigHCollection() {
        contentView.addSubview(bigHCollection)
        
        bigHCollection.backgroundColor = .red
        bigHCollection.translatesAutoresizingMaskIntoConstraints = false
        bigHCollection.delegate = self
        bigHCollection.dataSource = self
        bigHCollection.register(BigHCViewCell.self, forCellWithReuseIdentifier: "BigHCViewCell")
        
        NSLayoutConstraint.activate([
            bigHCollection.topAnchor.constraint(equalTo: smallHCollection.bottomAnchor, constant: 50),
            bigHCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bigHCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bigHCollection.heightAnchor.constraint(equalToConstant: 130*2+20)
        ])
    }
    
    func setupBigVCollection() {
        contentView.addSubview(bigVCollection)
        
        bigVCollection.backgroundColor = .red
        bigVCollection.translatesAutoresizingMaskIntoConstraints = false
        bigVCollection.delegate = self
        bigVCollection.dataSource = self
        bigVCollection.register(BigVCViewCell.self, forCellWithReuseIdentifier: "BigVCViewCell")
        
        NSLayoutConstraint.activate([
            bigVCollection.topAnchor.constraint(equalTo: bigHCollection.bottomAnchor, constant: 50),
            bigVCollection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            bigVCollection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            bigVCollection.heightAnchor.constraint(equalToConstant: 1000),
            bigVCollection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

// MARK: -- CollectionView Delegate
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 1:
            return 30
        case 2:
            return 15
        case 3:
            return 20
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallHCViewCell", for: indexPath) as! SmallHCViewCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigHCViewCell", for: indexPath) as! BigHCViewCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigVCViewCell", for: indexPath) as! BigVCViewCell
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView.tag {
        case 1:
            return CGSize(width: 70, height: 91)
        case 2:
            return CGSize(width: 130, height: 130)
        case 3:
            let width = collectionView.bounds.width
            let heigth = 130.0
            return CGSize(width: width, height: heigth)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
}

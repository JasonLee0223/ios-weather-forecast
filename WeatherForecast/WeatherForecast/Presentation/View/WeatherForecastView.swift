//
//  WeatherForecastView.swift
//  WeatherForecast
//
//  Created by Jason on 2023/04/03.
//

import UIKit

class WeatherForecastView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createLayout()
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Can't drawing collectioView")
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionView())
        
        collectionView.isScrollEnabled = true
        collectionView.clipsToBounds = true
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.register(WeatherForecastHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: WeatherForecastHeaderView.identifier)
        
        return collectionView
    }()
    
    func setDataSource(_ dataSource: UICollectionViewDataSource) {
        collectionView.dataSource = dataSource
    }
    
    func setDelegate(_ delegate: UICollectionViewDelegate) {
        collectionView.delegate = delegate
    }
    
    private func createLayout() {
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func configureCollectionView() -> UICollectionViewLayout {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50.0))
        
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(1.0))
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.interGroupSpacing = 0
        
        section.boundarySupplementaryItems = [header]
        section.orthogonalScrollingBehavior = .continuous
      
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}

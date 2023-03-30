//
//  WeatherCollectionView.swift
//  WeatherForecast
//
//  Created by Jason on 2023/03/30.
//

import UIKit

class WeatherCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Can't drawing collectioView")
    }
}

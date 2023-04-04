//
//  WeatherForecast - CollectionViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    typealias DiffableDataSource = UICollectionViewDiffableDataSource<Section, ForecastViewModel>
    
    private let repository = Repository()
    private lazy var weatherForecastView = WeatherForecastView(frame: view.frame)
    
    private var dataSourse: UICollectionViewDiffableDataSource<Section, ForecastViewModel>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = WeatherCollectionView()
        
        UserLocation.shared.authorize()
    }
    
    @IBAction func printWeatherInformation(_ sender: UIButton) {
        UserLocation.shared.address { (address, error) in
            if let error {
                print(error)
                return
            }

            if let address {
                print(address)
            }
        }
        
        guard let location = UserLocation.shared.location?.coordinate else {
            return
        }
        
        URLPath.allCases.forEach { weatherType in
            repository.loadData(with: location, path: weatherType) { data, error in
                if let error {
                    print(error)
                    return
                }

                if let data {
                    print(data)
                }
            }
        }
    }
    
}

//
//  WeatherForecast - WeatherController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherController: UICollectionViewController {
    
    private let repository = Repository()
    
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

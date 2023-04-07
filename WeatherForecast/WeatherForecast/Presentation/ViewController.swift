//
//  WeatherForecast - ViewController.swift
//  Created by yagom.
//  Copyright © yagom. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    private let repository = Repository()
    let apiDTO = APIWeatherModelDTO()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: configureCollectionView())
        
        collectionView.isScrollEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.clipsToBounds = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.register(CurrentWeatherHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CurrentWeatherHeaderView.identifier)
        collectionView.register(ForecastWeatherCell.self, forCellWithReuseIdentifier: ForecastWeatherCell.identifier)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        collectionView.backgroundColor = .red
        self.view.addSubview(collectionView)
        return collectionView
    }()
    private var currentWeather: CurrentViewModel?
    private var forecastWeather: ForecastViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiDTO.delegate = self
        collectionView.dataSource = self
        UserLocation.shared.authorize()
        apiDTO.determineDTO(with: apiDTO.receiveCurrentLocation())
    }
}

extension ViewController {
    private func configureCollectionView() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.headerMode = .supplementary
        return UICollectionViewCompositionalLayout.list(using: configuration)
    }
}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastWeatherCell.identifier, for: indexPath) as? ForecastWeatherCell else {
            return UICollectionViewCell()
        }
        
        if let celtifiedForecastWeatherModel = forecastWeather {
            cell.prepare(model: celtifiedForecastWeatherModel)
        }
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CurrentWeatherHeaderView.identifier, for: indexPath) as? CurrentWeatherHeaderView else {
                return UICollectionReusableView()
            }
            
            if let celtifiedCurrentWeatherModel = currentWeather {
                headerView.prepare(model: celtifiedCurrentWeatherModel)
            }
            
            return headerView
        default:
            return UICollectionReusableView()
        }
    }
}

extension ViewController: WeatherModelDelegate {
    func loadCurrentWeather(of: CurrentViewModel) {
        print(#line, "wow!")
        currentWeather = of
        self.collectionView.reloadData()
    }

    func loadForecastWeather(of: ForecastViewModel) {
        print(#line, "wow!")
        forecastWeather = of
        self.collectionView.reloadData()
    }

    
}

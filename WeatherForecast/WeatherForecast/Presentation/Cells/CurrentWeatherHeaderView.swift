//
//  CurrentWeatherHeaderView.swift
//  WeatherForecast
//
//  Created by Jason on 2023/04/04.
//

import UIKit

class CurrentWeatherHeaderView: UICollectionReusableView {
    
    //MARK: - Property
    
    static let identifier = "weatherHeaderView"
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - Private Property
    
    private var currentWeatherEmoji: UIImageView = {
        let currentWeatherEmoji = UIImageView()
        currentWeatherEmoji.image = UIImage(systemName: "cloud.sun.fill")
        currentWeatherEmoji.setContentHuggingPriority(.defaultHigh,
                                                      for: .horizontal)
        currentWeatherEmoji.contentMode = .scaleAspectFill
        currentWeatherEmoji.translatesAutoresizingMaskIntoConstraints = false
        currentWeatherEmoji.widthAnchor.constraint(equalTo: currentWeatherEmoji.heightAnchor, multiplier: 1.0).isActive = true
        return currentWeatherEmoji
    }()
    
    private var currentLocation: UILabel = {
        let currentLocation = UILabel()
        currentLocation.text = "서울특별시 용산구"
        currentLocation.font = .systemFont(ofSize: 18)

        return currentLocation
    }()

    private var lowestAndHighestTemperature: UILabel = {
        let lowestAndHighestTemperature = UILabel()
        lowestAndHighestTemperature.text = "최저 1.0˚ 최고 11.0˚"
        lowestAndHighestTemperature.font = .systemFont(ofSize: 18)

        return lowestAndHighestTemperature
    }()

    private var currentTemperature: UILabel = {
        let currentTemperature = UILabel()
        currentTemperature.text = "11.0˚"
        currentTemperature.font = .systemFont(ofSize: 30)
        
        return currentTemperature
    }()
    
    //MARK: - StackView
    
    private var addressInformationView: UIStackView = {
        let addressInformationView = UIStackView()
        addressInformationView.axis = .vertical
        addressInformationView.spacing = 3

        return addressInformationView
    }()
    
    private var currentInformationView: UIStackView = {
        let currentInformationView = UIStackView()
        currentInformationView.axis = .horizontal
        currentInformationView.spacing = 30
        return currentInformationView
    }()
    
    //MARK: - Configure Of Layout
    func configuration() {
        self.addSubview(currentInformationView)

        [currentLocation, lowestAndHighestTemperature, currentTemperature].forEach { label in
            self.addressInformationView.addArrangedSubview(label)
        }
        self.addressInformationView.subviews.forEach { subview in
            (subview as? UILabel)?.textColor = .white
        }
        
        [currentWeatherEmoji, addressInformationView].forEach { view in
            self.currentInformationView.addArrangedSubview(view)
        }
        
        currentInformationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            currentInformationView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            currentInformationView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            currentInformationView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            currentInformationView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
    }
}


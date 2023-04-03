//
//  CurrentViewModel.swift
//  WeatherForecast
//
//  Created by Jason on 2023/04/03.
//

import Foundation

struct CurrentViewModel: Hashable {
    let identifier = UUID()
    let currentWeatherEmogj: Data
    let currentLocation: String
    let lowestTemperature: String
    let highestTemperature: String
    let currentTemperature: String
    
    static func == (lhs: CurrentViewModel, rhs: CurrentViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

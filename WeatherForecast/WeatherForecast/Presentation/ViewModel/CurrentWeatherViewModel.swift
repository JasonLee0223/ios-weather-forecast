//
//  CurrentWeatherViewModel.swift
//  WeatherForecast
//
//  Created by Jason on 2023/04/05.
//

import Foundation

struct CurrentViewModel: Hashable {
    let identifier = UUID()
    let currentWeatherInformation: CurrentWeatherInformation
    let temperature: Temperature
    
    static func == (lhs: CurrentViewModel, rhs: CurrentViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

internal struct Temperature: Hashable {
    let lowestTemperature: String
    let highestTemperature: String
    let currentTemperature: String
}

internal struct CurrentWeatherInformation: Hashable {
    let currentWeatherEmogj: Data
    let currentLocation: String
}

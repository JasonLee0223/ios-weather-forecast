//
//  CurrentViewModel.swift
//  WeatherForecast
//
//  Created by Jason on 2023/04/05.
//

import Foundation

struct CurrentViewModel: Hashable, WeatherViewModel {
    let identifier = UUID()
    let currentWeatherIcon: String
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

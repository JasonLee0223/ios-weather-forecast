//
//  ForecastViewModel.swift
//  WeatherForecast
//
//  Created by Jason on 2023/04/05.
//

import Foundation

struct ForecastViewModel: Hashable, WeatherViewModel {
    let identifier = UUID()
    let forecastEmogi: String
    let forecastInformation: ForecastInformation
    
    static func == (lhs: ForecastViewModel, rhs: ForecastViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

internal struct ForecastInformation: Hashable {
    let forecastDate: String
    let forecastDegree: String
}

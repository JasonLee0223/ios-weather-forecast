//
//  ForecastViewModel.swift
//  WeatherForecast
//
//  Created by Jason on 2023/04/05.
//

import Foundation

struct ForecastViewModel: Hashable {
    let identifier = UUID()
    let forecastInformation: ForecastInformation
    let forecastEmogi: Data
    
    static func == (lhs: ForecastViewModel, rhs: ForecastViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

internal struct ForecastInformation: Hashable {
    let forecastDate: String
    let forecastDegree: String
}

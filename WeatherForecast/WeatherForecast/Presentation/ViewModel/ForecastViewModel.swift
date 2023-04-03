//
//  ForecastViewModel.swift
//  WeatherForecast
//
//  Created by Jason on 2023/04/03.
//

import Foundation

struct ForecastViewModel: Hashable {
    let identifier = UUID()
    let forecastInformation: String
    let forecastDegree: String
    let forecastEmogi: Data
    
    static func == (lhs: CurrentViewModel, rhs: CurrentViewModel) -> Bool {
        return lhs.identifier == rhs.identifier
    }
}

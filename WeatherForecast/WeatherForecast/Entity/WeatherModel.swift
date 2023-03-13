//
//  WeatherModel.swift
//  WeatherForecast
//
//  Created by Jason on 2023/03/13.
//

import Foundation

struct WeatherModel: Codable {
    private let name: String
    private let localNames: LocalNames
    private let latitude: Double
    private let longitude: Double
    private let country: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case localNames = "local_names"
        case latitude = "lat"
        case longitude = "lon"
        case country
    }
}

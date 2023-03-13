//
//  LocalNames.swift
//  WeatherForecast
//
//  Created by Jason on 2023/03/13.
//

import Foundation

struct LocalNames: Codable {
    private var english: String
    private var korea: String
    
    enum CodingKeys: String, CodingKey {
        case english = "en"
        case korea = "ko"
    }
}

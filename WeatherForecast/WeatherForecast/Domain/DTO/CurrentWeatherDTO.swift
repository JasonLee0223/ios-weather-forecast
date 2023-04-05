//
//  CurrentWeatherDTO.swift
//  WeatherForecast
//
//  Created by Jason on 2023/04/05.
//

import Foundation
import CoreLocation

final class CurrentWeatherDTO {
    
    let repository = Repository()
    
    //MARK: - Private Method
    private func receiveCurrentLocation() -> CLLocationCoordinate2D{
        guard let location = UserLocation.shared.location?.coordinate else {
            //TODO: - Error 처리
            return CLLocationCoordinate2D()
        }
        return location
    }
    
    private func determineDTO(with location: CLLocationCoordinate2D) {
        URLPath.allCases.forEach { path in
            switch path {
            case .currentWeather:
                repository.loadData(with: location,
                                    path: path) { weatherModel, error in
                    if let currentWeatherModel = weatherModel as? CurrentWeather {
                        self.makeCurrentWeatherDTO(with: currentWeatherModel)
                    }
                }
            case .forecastWeather:
                repository.loadData(with: location,
                                    path: path) { weatherModel, error in
                    if let forecastWeatherModel = weatherModel as? ForecastWeather {
                        self.makeForecastsWeatherDTO(with: forecastWeatherModel)
                    }
                }
            }
        }
    }
    
    private func makeCurrentWeatherDTO(with data: CurrentWeather) -> CurrentViewModel {
        var iconName: String = ""
        let minTemperature = data.main.temperatureMin
        let maxTemperature = data.main.temperatureMax
        let temperature = data.main.temperature
        
        data.weathers.forEach { element in
            iconName = element.icon
        }
        
        return CurrentViewModel(currentWeatherIcon: iconName,
                                temperature: Temperature(lowestTemperature: String(minTemperature),
                                                         highestTemperature: String(maxTemperature),
                                                         currentTemperature: String(temperature)))
    }
    
    private func makeForecastsWeatherDTO(with data: ForecastWeather) -> ForecastViewModel{
        var forecastDate: String = ""
        var forecastIcon: String = ""
        var forecastTemperature: Double = 0
        
        data.list.forEach { element in
            forecastDate = element.date
            forecastTemperature = element.main.temperature
            
            element.weather.forEach { element in
                forecastIcon = element.icon
            }
        }
        
        return ForecastViewModel(forecastInformation: ForecastInformation(forecastDate: forecastDate, forecastDegree: String(forecastTemperature)),
                          forecastEmogi: forecastIcon)
    }
}

//
//  AddCityViewModel.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import Foundation
import SwiftUI

class AddCityViewModel: ObservableObject {

    @Published var weather: WeatherModel?
    var cityName: String = ""
    
    func requestWeather(completion: @escaping () -> Void ) {
        WeatherService.shared.requestWeatherByCityName(city: self.cityName) { result in
            switch result {
            case .failure(let error):
                print("Error:: \(error.localizedDescription)")
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                    completion()
                }
            }
        }
    }
    
    
    
    
}

//
//  WeatherListViewModel.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/04.
//

import Foundation

class WeatherListViewModel: ObservableObject {
    
    @Published var weatherList: [WeatherModel] = [WeatherModel]()
    
}

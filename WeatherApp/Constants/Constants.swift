//
//  Constants.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import Foundation

struct Constants {
    static let API_KEY = "e2e7dbbe60f992e47a58814f73bbb8db"
    static let BASE_URL = "https://api.openweathermap.org/data/2.5/weather"
}

enum SubViews {
    case addCityView
    case setUnitView
}

enum Units: String, CaseIterable {
    case imperial = "Fahrenheit" // Fahrenheit
    case metric = "Celsius" // Celsius
    case standard = "Kelvin" // Kelvin
}

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

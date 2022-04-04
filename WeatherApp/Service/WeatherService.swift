//
//  WeatherService.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import Foundation
import SwiftUI

class WeatherService {
    static let shared = WeatherService() // singleton 사용을 위함
    
    public init() {}
    
    func requestWeatherByCityName(city cityName: String, units: Units = .imperial, completion: @escaping (Result<WeatherModel, NetworkError>) -> Void) {
        
        var unit: String {
            switch units {
            case .standard:
                return ""
            case .imperial:
                return "imperial"
            case .metric:
                return "metric"
            }
        }
        
        guard var components = URLComponents(string: Constants.BASE_URL) else { return }
        let queryItems = [URLQueryItem(name: "appid", value: Constants.API_KEY), URLQueryItem(name: "q", value: cityName), URLQueryItem(name: "units", value: unit)]
        components.queryItems = queryItems
        
        guard let requestURL = components.url else { return completion(.failure(.badURL))}
        
        URLSession.shared.dataTask(with: requestURL) { data, response, error in
            guard let data = data, error == nil else { return completion(.failure(.noData))}
            
            if let result = try? JSONDecoder().decode(WeatherModel.self, from: data) {
                completion(.success(result))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
    }
    
}

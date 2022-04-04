//
//  Weather.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import Foundation

struct WeatherModel: Decodable {
    let weather: [Weather]
    let main: Temp
    let sys: Sys
    let name: String
}

extension WeatherModel {
    static func dummy() -> WeatherModel {
        return WeatherModel(
            weather: [
                Weather(description: "Cloud")
        ],
            main: Temp(temp: 16.05),
            sys: Sys(sunrise: 1648988903, sunset: 1649033445),
            name: "Seoul"
        )
    }
}

struct Weather: Decodable {
    let description: String
}

struct Temp: Decodable {
    let temp: Double
}

struct Sys: Decodable {
    let sunrise: Int
    let sunset: Int
}

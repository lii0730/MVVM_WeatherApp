//
//  URL+Extensions.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import Foundation

extension URL {
    func requestWeatherByCityNameURL(urlString: String) -> URL? {
        return URL(string: urlString)
    }
}

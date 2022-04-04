//
//  Int+Extensions.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/04.
//

import Foundation


extension Int {
    func toDate() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        
        return dateFormatter.string(from: date)
    }
}

//
//  WeatherListCellView.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import SwiftUI

struct WeatherListCellView: View {
    
    var weather: WeatherModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(weather.name)
                .fontWeight(.bold)
                .font(.system(size: 20))
            
            HStack {
                Image(systemName: "sunrise")
                Text(weather.sys.sunrise.toDate())
                Spacer()
//                Image(systemName: "cloud.sun")
                Text(String(format: "%0.2f", weather.main.temp))
            }
            
            HStack {
                Image(systemName: "sunset")
                Text(weather.sys.sunset.toDate())
            }
        }
        .padding()
        .background(.purple.opacity(0.2))
        .cornerRadius(10)
        
    }
}

struct WeatherListCellView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListCellView(weather: WeatherModel.dummy())
    }
}

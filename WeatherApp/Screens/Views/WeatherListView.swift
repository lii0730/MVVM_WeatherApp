//
//  WeatherListView.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import SwiftUI

struct WeatherListView: View {
    
    @Binding var weatherList: [WeatherModel]
    
    var body: some View {
        List(weatherList, id: \.name) { weather in
            WeatherListCellView(weather: weather)
        }.listStyle(.plain)
    }
}

struct WeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListView(weatherList: .constant([WeatherModel.dummy()]))
    }
}

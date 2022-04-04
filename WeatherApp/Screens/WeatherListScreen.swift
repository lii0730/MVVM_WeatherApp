//
//  WeatherListScreen.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import SwiftUI

struct WeatherListScreen: View {
    @State var showSubView: Bool = false
    @State var subView: SubViews = .addCityView
    
    @ObservedObject var weatherListVM: WeatherListViewModel = WeatherListViewModel()
    
    var body: some View {
        NavigationView {
            WeatherListView(weatherList: self.$weatherListVM.weatherList)
                .navigationTitle("Cities")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            self.subView = .setUnitView
                            self.showSubView.toggle()
                        } label: {
                            Image(systemName: "gearshape")
                        }

                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            self.subView = .addCityView
                            self.showSubView.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }

                    }
                }
        }
        .sheet(isPresented: self.$showSubView) {
            switch self.subView {
            case .setUnitView:
                ChangeUnitScreen()
            case .addCityView:
                AddCityView(weatherList: self.$weatherListVM.weatherList)
            }
        }
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreen()
    }
}

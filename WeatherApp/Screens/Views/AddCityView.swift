//
//  AddCityView.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import SwiftUI

struct AddCityView: View {
    @ObservedObject var addCityVM = AddCityViewModel()
    @Environment(\.presentationMode) var presentationMode
    @Binding var weatherList: [WeatherModel]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    TextField("Enter city name", text: self.$addCityVM.cityName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: UIScreen.main.bounds.width - 40)
                        .fixedSize()
                    
                    Button("Save") {
                        // 입력된 내용을 받아서 api호출 후 결과를 List뷰로 보내야지
                        self.addCityVM.requestWeather {
                            if let weather = self.addCityVM.weather {
                                DispatchQueue.main.async {
                                    self.weatherList.append(weather)
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            }
                        }
                    }
                    .frame(width: 100, height: 10)
                    .padding()
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(10)
                }
                .padding()
                .frame(height: 200)
                .background(Color.init(UIColor.systemIndigo))
                .cornerRadius(20)
                .navigationTitle("Add City")
                
                Spacer()
            }
        }
    }
}

struct AddCityView_Previews: PreviewProvider {
    static var previews: some View {
        AddCityView(weatherList: .constant([WeatherModel.dummy()]))
    }
}

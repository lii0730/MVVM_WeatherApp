//
//  ChangeUnitViewModel.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/05.
//

import Foundation

class ChangeUnitViewModel: ObservableObject {
    
    static let shared = ChangeUnitViewModel()
    private init() {}
    
    @Published var unit: Units = .standard
    
}

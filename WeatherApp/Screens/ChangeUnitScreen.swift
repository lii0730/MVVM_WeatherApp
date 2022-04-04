//
//  ChangeUnitScreen.swift
//  WeatherApp
//
//  Created by LeeHsss on 2022/04/03.
//

import SwiftUI

struct ChangeUnitScreen: View {
    @State var unit: Units = .imperial
    
    var body: some View {
        NavigationView {
            ChangeUnitView()
        }
    }
}

struct ChangeUnitScreen_Previews: PreviewProvider {
    static var previews: some View {
        ChangeUnitScreen()
    }
}

struct ChangeUnitView: View {
    
    @ObservedObject var changeUnitVM = ChangeUnitViewModel.shared
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("Units", selection: $changeUnitVM.unit, content: {
                ForEach(Units.allCases, id: \.self) {
                    Text($0.rawValue)
                        .tag($0)
                }
            })
            .padding()
            .pickerStyle(SegmentedPickerStyle())
            
            Spacer()
        }
        .navigationTitle("Settings")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Done") {
                    // 변경된 설정값으로 단위 변환 처리 단위 선택
                    self.presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

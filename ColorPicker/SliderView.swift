//
//  SliderView.swift
//  ColorPicker
//
//  Created by Serge Broski on 3/4/24.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
//    @State var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text(sliderValue.formatted())
                .foregroundStyle(.white)
                .frame(width: 35)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
            TextField("", value: $sliderValue, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
        }
    }
}

//#Preview {
//    SliderView(sliderValue: sliderValue, color: .red)
//}

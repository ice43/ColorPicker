//
//  ColorView.swift
//  ColorPicker
//
//  Created by Serge Broski on 3/7/24.
//

import SwiftUI

struct ColorView: View {
    let redSliderValue: Double
    let greenSliderValue: Double
    let blueSliderValue: Double
    
    var body: some View {
        Color(
            red: redSliderValue / 255,
            green: greenSliderValue / 255,
            blue: blueSliderValue / 255
        )
        .frame(width: 350, height: 120)
        .clipShape(.rect(cornerRadius: 25))
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(.white, lineWidth: 4)
        )
    }
}

#Preview {
    ColorView(
        redSliderValue: Double.random(in: 0...255).rounded(),
        greenSliderValue: Double.random(in: 0...255).rounded(),
        blueSliderValue: Double.random(in: 0...255).rounded()
    )
}

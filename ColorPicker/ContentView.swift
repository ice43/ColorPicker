//
//  ContentView.swift
//  ColorPicker
//
//  Created by Serge Broski on 3/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = 255.0
    @State private var greenSliderValue = 255.0
    @State private var blueSliderValue = 255.0
    
    var body: some View {
        ZStack {
            Color.specialBlue
                .ignoresSafeArea()
            
            VStack(spacing: 50) {
                ColorView(
                    redSliderValue: $redSliderValue,
                    greenSliderValue: $greenSliderValue,
                    blueSliderValue: $blueSliderValue
                )
                
                VStack {
                    SliderView(
                        sliderValue: $redSliderValue,
                        color: .red
                    )
                    SliderView(
                        sliderValue: $greenSliderValue,
                        color: .green
                    )
                    SliderView(
                        sliderValue: $blueSliderValue,
                        color: .blue
                    )
                }
                
                Spacer()
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}


struct ColorView: View {
    @Binding var redSliderValue: Double
    @Binding var greenSliderValue: Double
    @Binding var blueSliderValue: Double
    
    var body: some View {
        Color(
            red: redSliderValue / 255,
            green: greenSliderValue / 255,
            blue: blueSliderValue / 255
        )
        .frame(width: 350, height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 25))
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(.white, lineWidth: 4))
    }
}

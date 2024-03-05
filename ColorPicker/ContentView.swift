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
    
    @State private var redValue = 255.0
    @State private var greenValue = 255.0
    @State private var blueValue = 255.0
    
    @FocusState private var textFieldFocus: Bool
    
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
                        sliderValue: $redSliderValue, displayedValue: $redValue,
                        color: .red
                    )
                    .focused($textFieldFocus)
                    
                    SliderView(
                        sliderValue: $greenSliderValue, displayedValue: $greenValue,
                        color: .green
                    )
                    .focused($textFieldFocus)
                    
                    SliderView(
                        sliderValue: $blueSliderValue, displayedValue: $blueValue,
                        color: .blue
                    )
                    .focused($textFieldFocus)
                }
                
                Spacer()
            }
            .padding()
        }
        
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Spacer()
            }
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    redSliderValue = redValue
                    greenSliderValue = greenValue
                    blueSliderValue = blueValue
                }
            }
        }
        
        .onTapGesture {
            textFieldFocus = false
            redSliderValue = redValue
            greenSliderValue = greenValue
            blueSliderValue = blueValue
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

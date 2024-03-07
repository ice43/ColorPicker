//
//  ContentView.swift
//  ColorPicker
//
//  Created by Serge Broski on 3/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    @FocusState private var textFieldFocus: Bool
    
    var body: some View {
        ZStack {
            VStack(spacing: 50) {
                ColorView(
                    redSliderValue: red,
                    greenSliderValue: green,
                    blueSliderValue: blue
                )
                
                VStack {
                    SliderView(sliderValue: $red, color: .red)
                    SliderView(sliderValue: $green, color: .green)
                    SliderView(sliderValue: $blue, color: .blue)
                }
                .frame(height: 150)
                .focused($textFieldFocus)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            textFieldFocus = false
                        }
                    }
                }

                Spacer()
            }
        }
        .padding()
        .background(.specialBlue)
        .onTapGesture {
            textFieldFocus = false
        }
    }
}

#Preview {
    ContentView()
}

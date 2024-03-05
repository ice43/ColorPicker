//
//  SliderView.swift
//  ColorPicker
//
//  Created by Serge Broski on 3/4/24.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    @Binding var displayedValue: Double
    
    @State private var isShowingAlert = false
    
    let color: Color
    
    var body: some View {
        HStack {
            Text(sliderValue.formatted())
                .foregroundStyle(.white)
                .frame(width: 35)
            
            Slider(value: Binding(get: {
                sliderValue
            }, set: { newValue in
                sliderValue = newValue
                displayedValue = newValue
            }), in: 0...255, step: 1)
                .tint(color)
                .animation(.easeInOut(duration: 2.0), value: sliderValue)
            
            TextField("", value: $displayedValue, format: .number)
                .textFieldStyle(.roundedBorder)
                .frame(width: 50)
                .keyboardType(.decimalPad)
        }
        
        
        .alert("Wrong format",
               isPresented: $isShowingAlert,
               actions: {
            Button("OK", role: .cancel) {
                displayedValue = sliderValue
            }
        },
               message: {
            Text("Please enter a number from 0 to 255")
        })
        
        .onChange(of: sliderValue) { _, newValue in
            if newValue > 255 {
                isShowingAlert = true
                sliderValue = 255
            }
        }
    }
}

#Preview {
    SliderView(sliderValue: .constant(125), displayedValue: .constant(125), color: .red)
}

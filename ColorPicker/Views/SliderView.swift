//
//  SliderView.swift
//  ColorPicker
//
//  Created by Serge Broski on 3/4/24.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue: Double
    let color: Color
    
    @State private var text = ""
    @State private var isShowingAlert = false
    
    var body: some View {
        HStack {
            Text(sliderValue.formatted())
                .foregroundStyle(.white)
                .frame(width: 35, alignment: .leading)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: sliderValue) { _, newValue in
                    text = newValue.formatted()
                }
            
            TextFieldView(text: $text, action: checkValue)
                .alert("Wrong format!", isPresented: $isShowingAlert, actions: {} ) {
                    Text("Please enter value from 0 to 255")
                }
                
        }
        
        .onAppear {
            text = sliderValue.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Double(text), (0...255).contains(value) {
            sliderValue = value
        } else {
            isShowingAlert.toggle()
            sliderValue = 0
            text = ""
        }
    }
}

#Preview {
    SliderView(sliderValue: .constant(125), color: .red)
}

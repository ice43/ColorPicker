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
    
    @FocusState private var textFieldFocus: Field?
    
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
                        .focused($textFieldFocus, equals: .red)
                    SliderView(sliderValue: $green, color: .green)
                        .focused($textFieldFocus, equals: .green)
                    SliderView(sliderValue: $blue, color: .blue)
                        .focused($textFieldFocus, equals: .blue)
                }
                .frame(height: 150)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: previousField){
                            Image(systemName: "chevron.up")
                        }
                        Button(action: nextField){
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            textFieldFocus = nil
                        }
                    }
                }

                Spacer()
            }
        }
        .padding()
        .background(.specialBlue)
        .onTapGesture {
            textFieldFocus = nil
        }
    }
}

private extension ContentView {
    enum Field {
        case red
        case green
        case blue
    }
    
    func nextField() {
        switch textFieldFocus {
        case .red:
            textFieldFocus = .green
        case .green:
            textFieldFocus = .blue
        case .blue:
            textFieldFocus = .red
        case .none:
            textFieldFocus = nil
        }
    }
        
    func previousField() {
        switch textFieldFocus {
        case .red:
            textFieldFocus = .blue
        case .green:
            textFieldFocus = .red
        case .blue:
            textFieldFocus = .green
        case .none:
            textFieldFocus = nil
        }
    }
}

#Preview {
    ContentView()
}

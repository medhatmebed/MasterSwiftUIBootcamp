//
//  ButtonStyleBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/3/24.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    var scaledAmount: CGFloat = 0.9
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaledAmount : 1.0)
            .opacity(configuration.isPressed ? 0.7 : 1.0)
    }
    
}

extension View {
    
    func withPressableStyle() -> some View {
        self.buttonStyle(PressableButtonStyle())
    }
}

struct ButtonStyleBootcamp: View {
    
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me!!")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(10)
                .shadow(radius: 10)
        }
        .withPressableStyle()
        //.buttonStyle(PressableButtonStyle())
        .padding(40)

    }
}

#Preview {
    ButtonStyleBootcamp()
}

//
//  ViewModifierBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/3/24.
//

import SwiftUI

struct DefaultButtonViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 10)
            .padding()
            
    }
}
extension View {
    func withDefaultButtonModifier() -> some View {
        modifier(DefaultButtonViewModifier())
    }
}


struct ViewModifierBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .modifier(DefaultButtonViewModifier())
            .withDefaultButtonModifier()
    }
}

#Preview {
    ViewModifierBootcamp()
}

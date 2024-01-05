//
//  ProtocolsBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/5/24.
//

import SwiftUI

struct DefaultColorTheme: DefaultColorThemeProtocol {
    let primary: Color = .blue
    let secondary: Color = .white
    let tertiary: Color = .gray
}

struct SecondaryColorTheme: DefaultColorThemeProtocol {
    let primary: Color = .purple
    let secondary: Color = .white
    let tertiary: Color = .pink
}

protocol DefaultColorThemeProtocol {
    var primary: Color { get }
    var secondary: Color { get }
    var tertiary: Color { get }
}

struct ProtocolsBootcamp: View {
    
    let colorTheme: DefaultColorThemeProtocol = SecondaryColorTheme()
    
    var body: some View {
        ZStack {
            colorTheme.tertiary
                .ignoresSafeArea()
            Text("Protocols are great")
                .font(.headline)
                .foregroundColor(colorTheme.secondary)
                .padding()
                .background(colorTheme.primary)
                .cornerRadius(10)
        }
    }
}

#Preview {
    ProtocolsBootcamp()
}

//
//  AnyTransitionBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/3/24.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let rotation: Double
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: rotation))
            .offset(
                x: rotation != 0 ? UIScreen.main.bounds.width : 0,
                y: rotation != 0 ? UIScreen.main.bounds.height : 0
            )
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(rotation: 180), identity: RotateViewModifier(rotation: 0))
    }
}


struct AnyTransitionBootcamp: View {
    
    @State private var showRectangle = false
    
    var body: some View {
        VStack {
            if showRectangle {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 250, height: 250)
                    .frame(maxWidth: .infinity)
               //     .transition(.move(edge: .leading))
                    .transition(AnyTransition.rotating)
            }
            Spacer()
            
            Text("Click Me")
                .withDefaultButtonModifier()
                .padding()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

#Preview {
    AnyTransitionBootcamp()
}

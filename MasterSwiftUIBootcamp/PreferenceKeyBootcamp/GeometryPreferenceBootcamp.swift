//
//  GeometryPreferenceBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/4/24.
//

import SwiftUI

struct GeometryPreferenceBootcamp: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .background(Color.blue)
            Spacer()
            HStack {
                Rectangle()
                Rectangle()
                Rectangle()
            }
            .frame(height: 55)
        }
    }
}

#Preview {
    GeometryPreferenceBootcamp()
}

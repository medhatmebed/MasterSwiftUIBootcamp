//
//  PreferenceKeyBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/4/24.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    
    @State private var text = "Hello World"
    
    var body: some View {
        NavigationStack {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation Title")
                   // .customTitle("Hello Medhat")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in
            text = value
        })
    }
}

extension View {
    
    func customTitle(_ text: String) -> some View {
        preference(key: CustomTitlePreferenceKey.self, value: text)
    }
    
}


struct SecondaryScreen: View {
    
    let text: String
    @State private var newValue = ""
    
    var body: some View {
        Text(text)
            .onAppear(perform: {
                getDataFromDatabase()
            })
            .customTitle(newValue)
    }
    
    func getDataFromDatabase() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            newValue = "New Value From Database"
        }
    }
}

struct CustomTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
    
}


#Preview {
    PreferenceKeyBootcamp()
}

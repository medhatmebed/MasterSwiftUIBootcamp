//
//  ErrorALertBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/7/24.
//

import SwiftUI

struct ErrorALertBootcamp: View {
    
    @State private var error: Error? = nil
    
    var body: some View {
        Button("Click Me") {
            saveData()
        }
        .alert(error?.localizedDescription ?? "Error", isPresented: Binding(value: $error)) {
            Button("OK") {
                
            }
        }
    }
    
    private func saveData() {
        
        let isSuccessful = false
        
        if isSuccessful {
            
        } else {
            
            let myError: Error = URLError(.badURL)
            
            error = myError
        }
        
    }
    
}

#Preview {
    ErrorALertBootcamp()
}

//
//  UITestingBootcampView.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/6/24.
//

import SwiftUI

class UITestingBootcampViewModel: ObservableObject {
    
    let placedholderText = "Add your name..."
    @Published var textFieldText = ""
    @Published var currentUserIsSignedIn = false
    
    func signUpButtonPressed() {
        guard !textFieldText.isEmpty else { return }
        currentUserIsSignedIn = true
    }
    
}

struct UITestingBootcampView: View {
    
    @StateObject private var vm = UITestingBootcampViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue, Color.black]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing)
            .ignoresSafeArea()
            
            ZStack {
                if vm.currentUserIsSignedIn {
                    Text("Hello Medhat")
                        .font(.title)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .trailing))
                }
                if !vm.currentUserIsSignedIn {
                    signUpLayer
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .transition(.move(edge: .leading))
                }
            }
            
        }
        
    }
}

#Preview {
    UITestingBootcampView()
}

extension UITestingBootcampView {
    private var signUpLayer: some View {

            
            VStack {
                TextField(vm.placedholderText, text: $vm.textFieldText)
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                
                Button {
                    withAnimation {
                        vm.signUpButtonPressed()
                    }
                } label: {
                    Text("Sign Up")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                
            }
            .padding()
   
    }
}

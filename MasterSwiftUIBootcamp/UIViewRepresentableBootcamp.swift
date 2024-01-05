//
//  UIViewRepresentableBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/5/24.
//

import SwiftUI

struct UIViewRepresentableBootcamp: View {
    
    @State private var text = ""
    
    var body: some View {
        Text(text)
        //BasicUIViewRepresentable()
        HStack {
            Text("SwiftUI")
            TextField("Type Here...", text: $text)
                .frame(height: 55)
                .background(Color.gray)
        }
        HStack {
            Text("UIKit")
            UITextFieldViewRrepresentable(text: $text)
                .frame(height: 55)
                .background(Color.gray)
        }
     
    }
}

#Preview {
    UIViewRepresentableBootcamp()
}

struct UITextFieldViewRrepresentable: UIViewRepresentable {
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextField{
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    // send data from SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    private func getTextField() -> UITextField {
        let textField = UITextField()
        let placeHolder = NSAttributedString(string: "Type Here...", attributes: [.foregroundColor : UIColor.red])
        textField.attributedPlaceholder = placeHolder
        return textField
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    // send data from UIKit to SwiftUI
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            text = textField.text ?? ""
        }
    }
    
}

struct BasicUIViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
    
    }
}

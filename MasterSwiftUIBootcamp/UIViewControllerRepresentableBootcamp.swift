//
//  UIViewControllerRepresentableBootcamp.swift
//  MasterSwiftUIBootcamp
//
//  Created by Medhat Mebed on 1/5/24.
//

import SwiftUI

struct UIViewControllerRepresentableBootcamp: View {
    
    @State private var showScreen = false
    @State private var image: UIImage? = nil
    
    var body: some View {
        VStack {
            Text(" Hello")
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
            Button {
                showScreen.toggle()
            } label: {
                Text("Click Me!!")
            }
            .sheet(isPresented: $showScreen, content: {
//                BasicUIViewControllerRepresentableBootcamp(labelText: "Hello View Controller")
                UIImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
            })

            
        }
    }
}

#Preview {
    UIViewControllerRepresentableBootcamp()
}


struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    @Binding var showScreen: Bool
    
    func makeUIViewController(context: Context) -> some UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
    }
    // from swiftui to uikit
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    // from uikit to swiftui
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showScreen: $showScreen)
    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var image: UIImage?
        @Binding var showScreen: Bool
        
        init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
            self._image = image
            self._showScreen = showScreen
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            image = newImage
            showScreen = false
        }
        
    }
    
    
}

struct BasicUIViewControllerRepresentableBootcamp: UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
//        let vc = UIViewController()
//        vc.view.backgroundColor = .blue
//        
//        let label = UILabel()
//        label.text = labelText
//        label.textColor = UIColor.white
//        
//        vc.view.addSubview(label)
//        label.frame = vc.view.frame
//        
        let vc = MyFirstViewController()
        vc.labelText = labelText
        return vc
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


class MyFirstViewController: UIViewController {
    
    var labelText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        
        let label = UILabel()
        label.text = labelText
        label.textColor = UIColor.white
        
        self.view.addSubview(label)
        label.frame = self.view.frame
        
        
    }
    
}

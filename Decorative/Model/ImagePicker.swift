//
//  ImagePicker.swift
//  Memory
//
//  Created by Swope, Thomas on 1/21/22.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @Binding var selectedImage: UIImage
// method creates and returns a UIImagePickerController instance
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {

        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator

        return imagePicker
    }
// method is empty since it doesn't need to update the view controller after it has been created
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
    // sets the delegate to a coordinator object that is created
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
// acts as the delegate for the UIImagePickerController
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
// retrieves the selected image from the info dictionary and assigns it to the selectedImage property of the parent ImagePicker instance
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
// returns control to the parent view
            parent.presentationMode.wrappedValue.dismiss()
        }

    }
}

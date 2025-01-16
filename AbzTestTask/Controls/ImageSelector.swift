//
//  FilePicker.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 11.01.2025.
//

import SwiftUI

struct ImageSelector: View {
    @Binding var image: UIImage?
    @State private var isPresented = false
    @State private var showCamera = false
    @State private var showGallery = false
    
    var body: some View {
        VStack {
            HStack {
                if image == nil {
                    Text("Upload your photo")
                        .foregroundColor(.appPrimaryTextDisabled)
                } else {
                    Image(uiImage: image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .onTapGesture {
                            isPresented = true
                        }
                }
                Spacer()
                Button("Upload") {
                    isPresented = true
                }
                .foregroundColor(.appSecondary)
            }
            .font(.heading1)
            .foregroundColor(.appPrimaryTextDisabled)
            .padding(20)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(.appGrayLight, lineWidth: 1)
        )
        .actionSheet(isPresented: $isPresented) {
            ActionSheet(
                title: Text("Choose how you want to add a photo"),
                buttons: [
                    .default(Text("Camera")) {
                        self.showCamera = true
                    },
                    .default(Text("Gallery")) {
                        self.showGallery = true
                    },
                    .cancel {}
                ]
            )
        }
        .sheet(isPresented: $showCamera) {
            ImagePicker(sourceType: .camera, image: self.$image)
        }
        .sheet(isPresented: $showGallery) {
            ImagePicker(sourceType: .photoLibrary, image: self.$image)
         }
    }
    

}

#Preview {
    @Previewable @State var image: UIImage?
    @Previewable @State var isSelector = false
    ImageSelector(image: $image)
    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
}

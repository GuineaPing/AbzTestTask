//
//  FilePicker.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 11.01.2025.
//

import SwiftUI

// Image camera/gallery selector control

struct ImageSelector: View {
    @Binding var image: UIImage?
    @State private var isPresented = false
    @State private var showCamera = false
    @State private var showGallery = false
    // flag enables to indicate control that not loaded image yet with red color
    @Binding var isWarning: Bool
    
    var body: some View {
        VStack(spacing: 5) {
            VStack {
                HStack {
                    if image == nil {
                        Text("Upload your photo")
                            .foregroundColor(isValidWarning ? .appRed : .appPrimaryTextDisabled)
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
                    .stroke(isValidWarning ? .appRed : .appGrayLight, lineWidth: 1)
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
            
            VStack {
                if isValidWarning {
                    HStack {
                        Text("Photo is required")
                            .font(.body1)
                            .foregroundStyle(.appRed)
                        
                        Spacer()
                    }
                    .padding(.leading, 16)
                }
            }
            .frame(height: 16)
        }

    }
    
    var isValidWarning: Bool {
        !isWarning && image == nil
    }
}

#Preview {
    @Previewable @State var image: UIImage?
    @Previewable @State var isSelector = false
    ImageSelector(
        image: $image,
        isWarning: Binding.constant(true)
    )
    .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
    Divider()
    HStack {
        Text("text")
        Spacer()
    }.padding(.leading, 20)
}

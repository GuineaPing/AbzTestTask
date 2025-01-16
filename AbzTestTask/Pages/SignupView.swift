//
//  Signup.swift
//  AbzTestTask
//
//  Created by Eugene Lysenko on 08.01.2025.
//

import SwiftUI

struct SignupView: View {
    @Binding var showError: Bool
    @Binding var status: StatusType
    @State private var refresh = false
    @State private var selectedImage: UIImage?
    @State private var selectedPosition: Int = 0
    @State private var userData: UserModel = UserModel(id: 1)
    @State private var signup = false
    @State private var validated = true
    @State private var isImageSelector = false
    @State private var signupDisabled = true
    @StateObject private var tokenData = TokenViewModel()
    @StateObject private var uploader = UserViewModel()
    
    var body: some View {
        VStack {
            
            PageHeader(title: "Working with POST request", tapped: $refresh)
            
            ZStack {
                fetchWait
                inputs
            }
            .onAppear {
                
            }
        }
    }
    
    var fetchWait: some View {
        VStack {
            if tokenData.isLoading {
                ProgressView().scaleEffect(3)
            } else {
                EmptyView()
            }
        }
    }
    
    var inputs: some View {
//        ScrollView {
            
            VStack {
                textInputs.padding(.bottom, 15)
                
                PositionSelector(selectedPosition: $userData.positionID, showError: $showError)
                    .padding(.bottom, 10)
                
                ImageSelector(
                    image: $selectedImage
                )
                .padding(.bottom, 10)
                
                ButtonRound(
                    title: "Sign up",
                    tap: $signup,
                    disabled: $signupDisabled)
                .onChange(of: signup) {
                    tokenData.fetchTokenData()
                }
                .onChange(of: tokenData.error) {
                    if tokenData.error != nil {
                        status = .connection
                        showError = true
                    }
                }
                .onChange(of: tokenData.token) {
                    uploader.uploadUser(token: tokenData.token, user: userData, selectedImage: selectedImage)
                }
                .onChange(of: selectedImage) { checkSubmitDisabled() }
                .onChange(of: userData.isValidated) { checkSubmitDisabled() }
                .onChange(of: uploader.status) {
                    print(">> status title: \(uploader.status.title)")
                    if (uploader.status != .undefined) {
                        status = uploader.status
                        showError = true
                    }
                }
            }
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 10, trailing: 20))
            
//        }.scrollIndicators(.automatic)
    }
    
    func checkSubmitDisabled() {
        signupDisabled = !userData.isValidated || selectedImage == nil
    }
    
    var textInputs: some View {
        VStack(spacing: 15) {
            EditText(text: $userData.name, placeholder: "Your name", warning: "Required field")
            EditText(text: $userData.email, placeholder: "Email", warning: "Required field")
            EditText(text: $userData.phone, placeholder: "Phone", comment: "+38 (XXX) XXX - XX - XX", warning: "Required field")
        }
    }
}

#Preview {
    SignupView(
        showError: Binding.constant(false),
        status: Binding.constant(.undefined)
    )
}

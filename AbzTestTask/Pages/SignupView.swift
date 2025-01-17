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
    @State private var userData: UserModel = UserModel() // (id: 1)
    @State private var signup = false
    
    @State private var isWarningName = false
    @State private var isWarningEmail = false
    @State private var isWarningPhone = false
    @State private var isSignupDisabled = false
    @State private var isSignupFirsAttempt = true
    
    @State private var isImageSelector = false
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
                // input text section
                textInputs.padding(.bottom, 15)
                
                // position selector
                PositionSelector(selectedPosition: $userData.positionID, showError: $showError)
                    .padding(.bottom, 10)
                
                // photo selector
                ImageSelector(
                    image: $selectedImage,
                    isWarning: $isSignupFirsAttempt
                )
                
                // submit button
                ButtonRound(
                    title: "Sign up",
                    tap: $signup,
                    disabled: $isSignupDisabled)
                .onChange(of: signup) {
                    submit()
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
                .onChange(of: userData.isNameValid) {
                    isWarningName = !userData.isNameValid && !isSignupFirsAttempt
                }
                .onChange(of: userData.isEmailValid) {
                    isWarningEmail = !userData.isEmailValid && !isSignupFirsAttempt
                }
                .onChange(of: userData.isPhoneValid) {
                    isWarningPhone = !userData.isPhoneValid && !isSignupFirsAttempt
                }
                .onChange(of: uploader.status) {
                    print(">> status title: \(uploader.status.title)")
                    if (uploader.status != .undefined) {
                        status = uploader.status
                        showError = true
                    }
                }
            }
            .padding(EdgeInsets(top: 30, leading: 20, bottom: 5, trailing: 20))
            
//        }.scrollIndicators(.automatic)
    }
    
    func checkSubmitDisabled() {
        isSignupDisabled =
            !(userData.isValidated && selectedImage != nil) ||
            isSignupFirsAttempt
        validationStatus()
    }
    
    func submit() {
        if isSignupFirsAttempt {
            if !userData.isValidated || selectedImage == nil {
                isSignupFirsAttempt = false
                isWarningName = !userData.isNameValid && !isSignupFirsAttempt
                isWarningEmail = !userData.isEmailValid && !isSignupFirsAttempt
                isWarningPhone = !userData.isPhoneValid && !isSignupFirsAttempt
                checkSubmitDisabled()
//                validationStatus()
                return
            }
        }
        tokenData.fetchTokenData()
    }
    
    func validationStatus() {
        print(">> isSignupDisabled: \(isSignupDisabled)")
        print(">> isSignupFirsAttempt: \(isSignupFirsAttempt)")
        print(">> isWarningName: \(isWarningName)")
        print(">> isWarningEmail: \(isWarningEmail)")
        print(">> isWarningPhone: \(isWarningPhone)")
        print(">>")
    }
    
    var textInputs: some View {
        VStack(spacing: 15) {
            EditText(text: $userData.name,
                     placeholder: "Your name",
                     warning: "Required field",
                     keyboardType: .default,
                     isWarning: $isWarningName
            )
            EditText(text: $userData.email,
                     placeholder: "Email",
                     warning: "Invalid email format",
                     warningTitle: "Email",
                     keyboardType: .emailAddress,
                     isWarning: $isWarningEmail
            )
            EditText(text: $userData.phone,
                     placeholder: "Phone",
                     comment: "+38 (XXX) XXX - XX - XX",
                     warning: "Required field +38 (XXX) XXX - XX - XX",
                     keyboardType: .namePhonePad,
                     isWarning: $isWarningPhone
            )
        }
    }
}

#Preview {
    SignupView(
        showError: Binding.constant(false),
        status: Binding.constant(.undefined)
    )
}

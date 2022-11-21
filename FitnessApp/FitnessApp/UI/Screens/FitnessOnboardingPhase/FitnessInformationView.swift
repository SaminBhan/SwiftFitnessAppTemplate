//
//  FitnessInformationView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI
import Combine

struct InformationTextField: View, AppConfigProtocol {
    let informationType: InformationType
    @Binding var textFieldString: String
    
    var body: some View {
        TextField(informationType.placeHolderText,
                  text: ($textFieldString)) {
                    self.endEditing(true)
        }.multilineTextAlignment(informationType.textAlignment)
            .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                      color: .black))
            .keyboardType(informationType.keyboardType)
    }
}

struct FitnessInformationView: View, AppConfigProtocol  {
    let informationType: InformationType
    @ObservedObject var passwordValidation = ATCPasswordValidator()
    @ObservedObject private var keyboard = KeyboardResponder()
    @State var showPassword: Bool = true
    @State var textFieldString: String = ""
    @State var firstRule: Bool = true
    @State var secondRule: Bool = false
    @State var thirdRule: Bool = true
    @State var pushActive = false
    
    init(informationType: InformationType) {
        self.informationType = informationType
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: informationType.nextDestination,
                           isActive: self.$pushActive) {
                            EmptyView()
            }.hidden()
            .navigationBarTitle("")
            BaseView(title: informationType.title,
                     buttonName: "Continue",
                     actionButton: { self.pushActive = true }) {
                VStack(alignment: .center, spacing: 25) {
                    HStack(alignment: .center, spacing: 21) {
                        if informationType == .password {
                            ATCSecureTextFieldView(placeholder: informationType.placeHolderText,
                                                   text: $passwordValidation.password)
                        } else {
                            if informationType == .phoneNumber {
                                ATCCountryCodeView()
                            }
                            InformationTextField(informationType: informationType,
                                                 textFieldString: $textFieldString)
                        }
                    }.padding()
                        .background(Color.white)
                        .cornerRadius(15.0)
                        .modifier(ATCShadowModifier(color: appConfig.shadowColor))
                    
                    if informationType == .password {
                        VerificationPasswordView(firstRule: passwordValidation.firstValidation,
                                                 secondRule: passwordValidation.secondValidation,
                                                 thirdRule: passwordValidation.thirdValidation)
                    }
                }.padding([.leading, .trailing], 21)
            }
        }
        .padding(.bottom, keyboard.currentHeight)
        .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
    }
}

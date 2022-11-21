//
//  FitnessVerificationCodeView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI
import Combine

struct FitnessVerificationCodeView: View, AppConfigProtocol {
    @ObservedObject private var keyboard = KeyboardResponder()
    @State var expand: Bool = false
    @State var textFieldString: String = ""
    @State var pushActive = false
    var body: some View {
        VStack {
            NavigationLink(destination: FitnessInformationView(informationType: .email),
                           isActive: self.$pushActive) {
                            EmptyView()
            }.hidden()
            .navigationBarTitle("")
            BaseView(title: "We sent you a code to verify your number",
                     buttonName: "Continue",
                     actionButton: { self.pushActive = true }) {
                        HStack(alignment: .center, spacing: 15) {
                            Spacer()
                            ForEach(0..<5) { _ in
                                SingleVerificationCodeView()
                            }
                            Spacer()
                        }
                        ATCSubFooterView(subText: "Didn't receive?",
                                         buttonText: "Resend in 00:05",
                                         appConfig: appConfig).padding(.top, 20)
            }
        }.padding(.bottom, keyboard.currentHeight)
            .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
    }
}

//
//  FitnessFingerPrintView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessFingerPrintView: View, AppConfigProtocol {
    @State var pushActive = false
    var body: some View {
        VStack {
            NavigationLink(destination: FitnessProfilePictureView(),
                           isActive: self.$pushActive) {
                            EmptyView()
            }.hidden()
            .navigationBarTitle("")
            BaseView(buttonName: "Continue",
                     footerButtonName: "Not Now",
                     actionButton: { self.pushActive = true }) {
                        VStack {
                            Image("fingerprint-icon")
                            ATCTitleDescriptionView(title: "Enable Fingerprint",
                                                    description: "If you enable touch ID, you don’t need to enter your password when you login.",
                                                    appConfig: appConfig).padding()
                        }
            }
        }
    }
}

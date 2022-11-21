//
//  FitnessProfilePictureView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessProfilePictureView: View, AppConfigProtocol {
    @State var pushActive = false
    var body: some View {
        VStack {
            NavigationLink(destination: FitnessCurrentLevelView(),
                           isActive: self.$pushActive) {
                            EmptyView()
            }.hidden()
            .navigationBarTitle("")
            BaseView(buttonName: "Continue",
                     actionButton: { self.pushActive = true }) {
                        VStack(alignment: .center, spacing: 33){
                            VStack(alignment: .center, spacing: 13.5) {
                                Image("dropdown-icon")
                                ATCCenteredListView(data: ["cat-icon", "ghost-icon", "monkey-icon", "cat-icon", "ghost-icon", "monkey-icon"])
                                    .frame(height: 100)
                                Image("dropdown-icon")
                                    .rotationEffect(.radians(.pi))
                            }
                            ATCTitleDescriptionView(title: "Profile Picture",
                                                    description: "You can select photo from one of this emoji or add your own photo as profile picture",
                                                    appConfig: appConfig)
                                .padding([.leading, .trailing], 20)
                            
                            Button(action: {
                                print("Got here")
                            }) {
                                Text("Add Custom Photo")
                                    .modifier(ATCTextModifier(font: appConfig.mediumBoldFont,
                                                              color: appConfig.mainThemeForegroundColor))
                            }
                        }
            }
        }
    }
}

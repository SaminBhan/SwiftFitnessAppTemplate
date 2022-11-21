//
//  FitnessSuccessRegistrationView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessSuccessRegistrationView: View, AppConfigProtocol {
    @State var pushActive = false
    var body: some View {
        VStack {
            NavigationLink(destination: FitnessNutritionTutorialView(),
                           isActive: self.$pushActive) {
                            EmptyView()
                }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .hidden()
            BaseView(buttonName: "Get Started",
                     isLogoShown: false,
                     backgroundImage: Image("fitness-success-background"),
                     isStandardButton: false,
                     actionButton: { self.pushActive = true }) {
                        VStack {
                            Spacer()
                            Image("fitness-success-icon")
                            VStack(alignment: .center, spacing: 15) {
                                Text("You are ready to go!")
                                    .modifier(ATCTextModifier(font: FitnessAppConfiguration.shared.boldSuperLargeFont,
                                                              color: .white))
                                Text("Thanks for taking your time to create an account with us. Now this is the fun part, let’s explore the app.")
                                    .lineSpacing(7)
                                    .modifier(ATCTextModifier(font: FitnessAppConfiguration.shared.regularMediumFont,
                                                              color: .white)).opacity(0.7)
                            }.padding([.trailing, .leading], 50)
                            Spacer()
                        }
            }
        }
    }
}

struct FitnessSuccessRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessSuccessRegistrationView()
    }
}

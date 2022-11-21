//
//  FitnessShareResultView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessShareAchievedResultView: View, AppConfigProtocol {
    var body: some View {
        BaseView(buttonName: "Share to Friend",
                 footerButtonName: "Not Now",
                 isLogoShown: false,
                 backgroundImage: Image("fitness-share-result-background")) {
                    VStack(spacing: 31) {
                        Text("Goal Achieved! \nShare with friends")
                            .modifier(ATCTextModifier(font: appConfig.boldSuperLargeFont,
                                                      color: .white))
                            .padding()
                        FitnessAchievedResultView()
                            .frame(width: 331, height: 380, alignment: .center)
                            .cornerRadius(15)
                        Text("Use our hashtag #momotaro on instagram and twitter")
                            .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                                      color: .gray)).padding()
                    }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

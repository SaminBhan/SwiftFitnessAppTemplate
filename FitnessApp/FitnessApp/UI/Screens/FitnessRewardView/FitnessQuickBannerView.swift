//
//  FitnessQuickBannerView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessQuickBannerView: View, AppConfigProtocol {
    let content: String
    let buttonName: String
    let actionButton: () -> Void
    var body: some View {
        HStack {
            Text(content)
                .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                          color: appConfig.mainThemeForegroundColor))
            Spacer()
            Button(action: {
                self.actionButton()
            }) {
                Text(buttonName)
                    .modifier(ATCButtonModifier(font: appConfig.mediumBoldFont,
                                                color: appConfig.mainThemeForegroundColor,
                                                width: 90,
                                                height: 36))
            }
        }.padding()
            .frame(height: 64)
            .background(Color(appConfig.hairlineColor))
    }
}

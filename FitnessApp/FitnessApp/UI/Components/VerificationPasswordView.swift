//
//  VerificationPasswordView.swift
//  FitnessApp
//
//  Created by Duy Bui on 1/9/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import SwiftUI

struct SingleVerificationPasswordView: View, AppConfigProtocol {
    let isPassed: Bool
    let text: String
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Rectangle()
                .fill(Color(isPassed ? appConfig.mainThemeForegroundColor : appConfig.colorGray3))
                .frame(width: 15, height: 15)
                .cornerRadius(4)
            Text(text)
                .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                                color: appConfig.colorGray9))
            Spacer()
        }
    }
}

struct VerificationPasswordView: View, AppConfigProtocol {
    let firstRule: Bool
    let secondRule: Bool
    let thirdRule: Bool
    var body: some View {
        VStack(spacing: 19) {
            SingleVerificationPasswordView(isPassed: firstRule, text: "8+ character")
            SingleVerificationPasswordView(isPassed: secondRule, text: "At least 1 uppercase")
            SingleVerificationPasswordView(isPassed: thirdRule, text: "At least 1 symbol")
        }
    }
}

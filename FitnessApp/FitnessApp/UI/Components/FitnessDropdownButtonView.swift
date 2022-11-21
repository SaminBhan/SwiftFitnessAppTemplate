//
//  FitnessDropdownButtonView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessDropdownView: View, AppConfigProtocol {
    var body: some View {
        HStack {
            Text("Today")
                .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                          color: .gray))
            Image("fitness-gray-dropdown-icon")
        }.padding()
            .background(Color(appConfig.mainThemeBackgroundColor))
            .cornerRadius(6)
    }
}

struct FitnessDropdownButtonView: View, AppConfigProtocol {
    var body: some View {
        HStack(alignment: .center) {
            Text("Statistic")
                .modifier(ATCTextModifier(font: appConfig.boldFont(size: 20),
                                          color: .black))
            Spacer()
            FitnessDropdownView()
        }
    }
}

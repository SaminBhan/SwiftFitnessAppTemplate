//
//  FitnessBadgesView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessBadgeView: View, AppConfigProtocol {
    let title: String
    let subTitle: String
    let image: String
    
    var body: some View {
        HStack(spacing: 20) {
            Image(image)
            VStack(alignment: .leading, spacing: 10) {
                Text(title)
                    .modifier(ATCTextModifier(font: appConfig.mediumBoldFont,
                                              color: .black))
                Text(subTitle)
                    .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                              color: .gray))
                ATCSeparatorHorizontalLineView()
            }
        }
    }
}

struct FitnessBadgesView: View, AppConfigProtocol {
    var body: some View {
        VStack {
            FitnessTitleContainerView(title: "Badges",
                                      font: appConfig.boldFont(size: 20),
                                      isNeedMoreOption: true)
            VStack(spacing: 20) {
                ForEach(0..<2) { ind in
                    FitnessBadgeView(title: FitnessMockingData.shared.badgesData[ind].1,
                                                  subTitle: "Walk 20,000 a day",
                                                  image: FitnessMockingData.shared.badgesData[ind].0)
                }.listRowBackground(Color.clear)
            }
        }
    }
}

//
//  FitnessInsightView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessInsightView: View, AppConfigProtocol {
    let waterInsight: [(date: String, water: CGFloat)]
    var body: some View {
        VStack {
            FitnessTitleContainerView(title: "Insight",
                                      font: appConfig.boldFont(size: 20),
                                      isNeedMoreOption: false).padding()
            
            HStack(spacing: 40) {
                ForEach(waterInsight, id: \.date) {
                    FitnessInsightItemView(insightItem: $0)
                }
            }
        }
    }
}

struct FitnessInsightItemView: View, AppConfigProtocol {
    let insightItem: (date: String, water: CGFloat)
    var body: some View {
        VStack {
            ATCVerticalProgressBarView(progress: .constant(insightItem.water))
            Text(insightItem.date)
                .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                          color: .gray))
        }
    }
}


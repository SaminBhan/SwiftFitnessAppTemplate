//
//  FitnessTargetTrackingView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessProgressTargetView: View, AppConfigProtocol {
    let title: String
    let value: String
    var body: some View {
        VStack {
            Text(title)
                .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                          color: .gray))
            Text(value)
                .modifier(ATCTextModifier(font: appConfig.boldFont(size: 20),
                                          color: .black))
        }
    }
}

struct FitnessProgressTargetsView: View {
    var body: some View {
        HStack(spacing: 80) {
            FitnessProgressTargetView(title: "Start", value: "55 kg")
            FitnessProgressTargetView(title: "Target", value: "50 kg")
            FitnessProgressTargetView(title: "Loss", value: "1.5 kg")
        }
    }
}

struct FitnessTargetTrackingView: View, AppConfigProtocol {
    var body: some View {
        VStack {
            FitnessProgressTargetsView()
            ATCLineChartView(data: [60,40,60,45,80,1],
                             style: ChartStyle(backgroundColor: Color(appConfig.mainThemeBackgroundColor),
                                               textColor: Color.black,
                                               chartBoardTextColor: Color.gray,
                                               dropShadowColor: Color.gray))
                .frame(height: 210)
                .padding()
        }
    }
}

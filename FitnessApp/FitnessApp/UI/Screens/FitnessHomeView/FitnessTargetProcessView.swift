//
//  FitnessTargetProcessView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessTargetProcessView: View, AppConfigProtocol {
    let fitnessTracking: FitnessTrackingProgressProtocol
    
    var body: some View {
        VStack {
            VStack {
                HStack(spacing: 20) {
                    Image(fitnessTracking.image)
                    VStack(alignment: .leading, spacing: 15) {
                        Text(fitnessTracking.title)
                            .modifier(ATCTextModifier(font: appConfig.mediumBoldFont,
                                                      color: appConfig.mainThemeForegroundColor))
                        Text(fitnessTracking.value)
                            .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                                      color: .gray))
                    }
                    Spacer()
                    Text(fitnessTracking.isWarning ? "On track": "Warning")
                        .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                                  color: fitnessTracking.isWarning ? UIColor.orange: appConfig.mainThemeForegroundColor))
                        .padding()
                        .frame(width: 120, height: 30)
                        .background(Color(fitnessTracking.isWarning ? UIColor(hexString: "#FFEFE5") : appConfig.hairlineColor))
                        .cornerRadius(20.0)
                }.padding()
                Image("fitness-line-graph-image")
            }.padding().background(Color.white)
        }
    }
}

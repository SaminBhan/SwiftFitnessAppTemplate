//
//  FitnessCurrentLevelView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessLevelLimitation: View, AppConfigProtocol {
    let title: String
    var body: some View {
        Group {
            Text(title)
                .modifier(ATCTextModifier(font: appConfig.boldSmallFont,
                                          color: appConfig.mainThemeForegroundColor))
        }.padding([.leading, .trailing], 18)
            .padding([.top, .bottom], 8)
            .background(Color(appConfig.hairlineColor))
            .cornerRadius(17.5)
    }
}

struct FitnessCurrentLevelView: View, AppConfigProtocol {
    @State var sliderValue: Double = 0.5
    @State var pushActive = false
    var body: some View {
        VStack {
            NavigationLink(destination: FitnessGoalsView(),
                           isActive: self.$pushActive) {
                            EmptyView()
            }
            .hidden()
            .navigationBarTitle("")
            BaseView(title: "What’s your current fitness level?",
                     buttonName: "Continue",
                     actionButton: { self.pushActive = true }) {
                        Spacer()
                        ZStack {
                            Image("fitness-meter-icon")
                            ATCSliderView(
                                thumbColor: .white,
                                minTrackColor: .clear,
                                maxTrackColor: .clear,
                                scaleRatio: 1.4,
                                value: $sliderValue
                            ).padding([.trailing, .leading], 20)
                                .padding(.top, 15)
                        }
                        HStack {
                            FitnessLevelLimitation(title: "Not Fit")
                            Spacer()
                            FitnessLevelLimitation(title: "Super Fit")
                        }.padding([.trailing, .leading], 40)
                        Spacer()
                        ATCTitleDescriptionView(title: "Moderate Intentsity",
                                                titleFont: appConfig.boldLargeFont,
                                                titleColor: .black,
                                                description: "I always work out regulary two or three times a week. ",
                                                descriptionFont: appConfig.regularMediumFont,
                                                descriptionColor: .black,
                                                appConfig: appConfig).padding([.trailing, .leading], 60)
                        Spacer()
            }
        }
    }
}

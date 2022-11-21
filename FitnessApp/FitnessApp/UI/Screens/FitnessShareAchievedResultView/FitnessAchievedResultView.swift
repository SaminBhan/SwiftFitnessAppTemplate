//
//  FitnessAchievedResultView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessVisualGoalView: View, AppConfigProtocol {
    let image: String
    let trackingNumber: String
    let content: String
    let paddingTop: CGFloat
    let paddingLead: CGFloat
    var body: some View {
        ZStack {
            Image(image)
            VStack(alignment: .leading) {
                Text(trackingNumber)
                    .modifier(ATCTextModifier(font: appConfig.boldSuperLargeFont,
                                              color: .black))
                Text(content)
                    .modifier(ATCTextModifier(font: appConfig.regularFont(size: 11),
                                              color: .gray))
            }.padding(.top, paddingTop)
            .padding(.leading, paddingLead)
        }
    }
}

struct FitnessAchievedInformationView: View, AppConfigProtocol {
    let value: String
    let content: String
    var body: some View {
        VStack {
            Text(value)
                .modifier(ATCTextModifier(font: appConfig.boldLargeFont,
                                          color: .black))
            Text(content)
                .modifier(ATCTextModifier(font: appConfig.regularFont(size: 11),
                                          color: .gray))
        }
    }
}

struct FitnessAllAchievedInformationView: View, AppConfigProtocol {
    let content: [(value: String, note: String)]
    var body: some View {
        HStack {
            Spacer()
            FitnessAchievedInformationView(value: content[0].value, content: content[0].note)
            Spacer()
            ATCSeparatorVerticalLineView()
            Spacer()
            FitnessAchievedInformationView(value: content[1].value, content: content[1].note)
            Spacer()
        }
    }
}

struct FitnessAchievedResultView: View, AppConfigProtocol {
    var body: some View {
        VStack {
            ATCFeedHeaderInfoView(image: "mocking-avatar-icon-5",
                                  squareLength: 40,
                                  username: "Grace Saraswati",
                                  content: { Image("fitness-small-icon")}).padding([.top, .leading, .trailing])
            ATCSeparatorHorizontalLineView().padding(.horizontal)
            FitnessVisualGoalView(image: "step-foots-image",
                                  trackingNumber: "10.000",
                                  content: "steps today",
                                  paddingTop: 80,
                                  paddingLead: 0).padding()
            FitnessAllAchievedInformationView(content: [(value: "1,300 cal", note: "Cal Burned"), (value: "10,000", note: "Daily Goal")])
                .padding(.vertical)
        }.background(Color.white)
    }
}

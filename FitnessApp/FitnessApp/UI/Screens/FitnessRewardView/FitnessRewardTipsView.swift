//
//  FitnessRewardTipsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessRewardTipsView: View, AppConfigProtocol {
    var body: some View {
        CarouselContentView(title: "Browse") {
            ForEach(FitnessMockingData.shared.mockingReward, id: \.id) {
                FitnessRewardTipView(fitnessReward: $0)
                    .cornerRadius(10)
                    .modifier(ATCShadowModifier(color: self.appConfig.shadowColor))
            }
        }
    }
}

struct FitnessRewardTipView: View, AppConfigProtocol {
    let fitnessReward: FitnessQuickContent
    var body: some View {
        VStack {
            Image(fitnessReward.image)
                .resizable()
                .frame(height: 108, alignment: .center)
            VStack(alignment: .leading, spacing: 20) {
                Text(fitnessReward.title)
                    .multilineTextAlignment(.leading)
                    .modifier(ATCTextModifier(font: appConfig.mediumBoldFont,
                                              color: .black))
                Text(fitnessReward.subTitle)
                    .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                              color: .gray))
            }.padding([.top, .bottom])
        }.frame(width: 200)
            .background(Color.white)
    }
}


struct FitnessRewardTipsView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessRewardTipsView()
    }
}

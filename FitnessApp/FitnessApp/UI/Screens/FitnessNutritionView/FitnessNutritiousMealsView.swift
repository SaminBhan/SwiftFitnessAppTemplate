//
//  FitnessNutritiousMealsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessNutritiousMealsView: View, AppConfigProtocol {
    private let title: String
    private let trackingTargets: [FitnessTrackingProgressProtocol]
    init(title: String, trackingTargets: [FitnessTrackingProgressProtocol]) {
        self.title = title
        self.trackingTargets = trackingTargets
    }
    var body: some View {
        VStack {
            FitnessTitleContainerView(title: title,
                                      font: appConfig.boldFont(size: 20))
                .padding([.top, .leading, .trailing])
            VStack {
                ForEach(trackingTargets, id: \.title) { target in
                    VStack {
                        ATCHealthTrackingInformationView(image: target.image,
                                                         trackingInformation: target.title,
                                                         value: "50",
                                                         subDescription: target.value)
                        ATCSeparatorHorizontalLineView()
                    }.padding(.horizontal )
                }
            }
        }.background(Color.white)
    }
}

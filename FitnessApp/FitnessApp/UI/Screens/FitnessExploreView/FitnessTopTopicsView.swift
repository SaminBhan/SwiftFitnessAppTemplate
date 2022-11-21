//
//  FitnessTopTopicsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessTopTopicsView: View, AppConfigProtocol {
    var body: some View {
        CarouselContentView(title: "Topics For You") {
            ForEach(0..<5) {
                SingleInterestView(interest: self.appConfig.interests[$0],
                                   colorCirle: Color(self.appConfig.mainThemeBackgroundColor))
            }
        }
    }
}

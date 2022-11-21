//
//  FitnessCategoryPodcastView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessCategoryPodcastView: View, AppConfigProtocol {
    let categoryPodcast: FitnessQuickContentProtocol
    var body: some View {
        HStack(alignment: .center, spacing: 14) {
            Image(categoryPodcast.image)
            .resizable()
                .frame(width: 58,
                       height: 58,
                       alignment: .center)
            VStack(alignment: .leading, spacing: 10) {
                Text(categoryPodcast.title)
                    .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                              color: .black))
                Text(categoryPodcast.subTitle)
                    .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                              color: .gray))
            }
            Spacer()
        }.frame(width: 295, height: 58)
    }
}

struct FitnessCategoryPodcastsView: View, AppConfigProtocol {
    let title: String
    let dataSource: [FitnessQuickContentProtocol]
    var body: some View {
        CarouselContentView(title: title,
                            isNeedMoreOption: false) {
                                ATCGridView(rows: 2,
                                            columns: Int(dataSource.count / 2) + 1,
                                            rowSpacing: 40,
                                            columnSpacing: 30) { row, col in
                                                FitnessCategoryPodcastView(categoryPodcast: self.dataSource[row * 2])
                                                    .modifier(ATCShadowModifier(color: self.appConfig.shadowColor))
                                }
        }
    }
}

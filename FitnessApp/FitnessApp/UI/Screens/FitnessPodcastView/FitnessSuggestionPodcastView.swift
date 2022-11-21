//
//  FitnessSuggestionPodcastView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessSuggestionPodcastView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Image("fitness-play-button")
                .padding([.trailing, .leading], 137)
                .padding([.top, .bottom], 36)
                .background(Image("fitness-orange-card-image"))
            ATCAuthorView(fitnessArticle: FitnessMockingData.shared.articles[0])
                .padding([.trailing, .leading])
        }.frame(width: 316, height: 200)
        .cornerRadius(10)
    }
}

struct FitnessSuggestionPodcastView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessSuggestionPodcastView()
    }
}

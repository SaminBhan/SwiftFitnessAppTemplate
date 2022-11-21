//
//  FitnessPodcastDetailContentView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessPodcastDetailContentView: View, AppConfigProtocol {
    let actionButton: () -> Void
    var body: some View {
        VStack {
            Image("fitness-podcast-details-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
            VStack(alignment: .center) {
                Text("Sleep With Me Bedtime Stories Podcast")
                    .modifier(ATCTextModifier(font: appConfig.boldSuperLargeFont,
                                              color: .black))
                    .multilineTextAlignment(.leading)
                VStack(alignment: .leading) {
                    HStack {
                        ATCAvatarView(image: "mocking-avatar-icon-1", squareLength: 40)
                        Text("by Joseph Fink")
                            .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                      color: .black))
                    }
                    Text("Train your mind for a happier, healthier life by learning the fundamentals of mediation and mindfullness.")
                        .modifier(ATCTextModifier(font: appConfig.boldLargeFont,
                                                  color: .black))
                }
                VStack {
                    ATCSeparatorHorizontalLineView()
                    ATCTextAndToggleView(text: "Download Meditation",
                                         subText: "100mb",
                                         isToggleShown: true,
                                         useThemeColor: true)
                    ATCSeparatorHorizontalLineView()
                }
                Button(action: {
                    self.actionButton()
                }) {
                    Text("Play Now")
                        .modifier(ATCButtonModifier(font: appConfig.mediumBoldFont,
                                                    color: appConfig.mainThemeForegroundColor,
                                                    width: 300,
                                                    height: 50))
                }.padding(.top, 7)
            }.padding()
        }
    }
}

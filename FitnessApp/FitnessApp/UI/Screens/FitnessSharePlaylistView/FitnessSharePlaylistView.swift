//
//  FitnessSharePlaylistView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessSharePlaylistView: View, AppConfigProtocol {
    var body: some View {
        BaseView(buttonName: "Share Now",
                 isLogoShown: false,
                 backgroundImage: Image("fitness-shareplaylist-background")) {
                    VStack(spacing: 31) {
                        Text("Share Your Favourite Playlist!")
                            .modifier(ATCTextModifier(font: appConfig.boldSuperLargeFont,
                                                      color: .white))
                            .padding()
                        FitnessPlayListView(currentSong: FitnessMockingData.shared.songs[4])
                            .frame(width: 331, height: 400, alignment: .center)
                            .cornerRadius(15)
                        Text("Use our hashtag #momotaro on instagram and twitter") .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                                                                                             color: .gray)).padding()
                    }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct FitnessSharePlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessSharePlaylistView()
    }
}

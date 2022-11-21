//
//  FitnessPlaylistView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessPlayListView: View, AppConfigProtocol {
    let currentSong: FitnessSongProtocol
    var body: some View {
        VStack(spacing: 25) {
            Image("fitness-play-button")
                .padding(.top, 30)
            VStack(spacing: 15) {
                VStack(spacing: 8) {
                    Text(currentSong.name)
                        .modifier(ATCTextModifier(font: appConfig.boldLargeFont,
                                                  color: .black))
                    Text("\(currentSong.category.content) - \(currentSong.singer)")
                        .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                                  color: .gray))
                        .frame(width: 400)
                }
                Image("fitness-rating-star")
            }
            List {
                ForEach(0..<4) {
                    FitnessSongView(song: FitnessMockingData.shared.songs[$0])
                }
            }.padding([.leading, .trailing], 30)
        }.background(Color.white)
    }
}

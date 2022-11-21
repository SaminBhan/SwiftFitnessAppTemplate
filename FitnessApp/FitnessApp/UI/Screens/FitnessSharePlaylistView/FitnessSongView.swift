//
//  FitnessSongView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessSongView: View, AppConfigProtocol {
    let song: FitnessSongProtocol
    var body: some View {
        HStack {
            Text(song.songId)
                .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                          color: .gray))
            Text(song.name)
                .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                          color: .black))
            Spacer()
            Text(song.duration)
                .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                          color: .black))
        }.padding(10)
    }
}

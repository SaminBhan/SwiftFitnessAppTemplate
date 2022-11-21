//
//  FitnessPlayerControlsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessPlayerControlsView: View, AppConfigProtocol {
    var body: some View {
        HStack(spacing: 44) {
            Button(action: {
                print("backward")
            }) {
                Image("audioplayer-backward-icon")
            }.buttonStyle(PlainButtonStyle())
            FitnessPlayerPlayControlView()
            Button(action: {
                print("forward")
            }) {
                Image("audioplayer-forward-icon")
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

struct FitnessPlayerPlayControlView: View, AppConfigProtocol {
    @State private var isPlayed = false
    @ObservedObject var audioPlayer = ATCAudioPlayerHelper()
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                self.isPlayed.toggle()
                self.audioPlayer.startPlayback(audio: URL(fileURLWithPath: Bundle.main.path(forResource: "empire-state.mp3",
                                                                                            ofType: nil)!),
                                               isPause: !self.isPlayed)
            }) {
                Image(isPlayed ? "audioplayer-pause-icon" : "audioplayer-play-icon")
            }.buttonStyle(PlainButtonStyle())
        }.frame(width: 84, height: 84)
            .background(Color(appConfig.mainThemeForegroundColor))
            .cornerRadius(42)
    }
}

struct FitnessPlayerProgressBarView: View, AppConfigProtocol {
    let startTime: String
    let endTime: String
    var body: some View {
        HStack(spacing: 15) {
            Text(startTime)
                .modifier(ATCTextModifier(font: appConfig.regularFont(size: 13),
                                          color: appConfig.hairlineColor))
            ATCHorizontalProgressBarView(progress: .constant(25.0))
            Text(endTime)
                .modifier(ATCTextModifier(font: appConfig.regularFont(size: 13),
                                          color: appConfig.hairlineColor))
        }
    }
}

struct FitnessPlayerControlsView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessPlayerControlsView()
    }
}

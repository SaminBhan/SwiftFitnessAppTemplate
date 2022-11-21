//
//  FitnessPodcastPlayerView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI
import AVKit

struct FitnessPodcastPlayerView: View, AppConfigProtocol {
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack {
                VStack(spacing: 40) {
                    Spacer()
                    HStack {
                        Spacer()
                    }
                    Spacer()
                    VStack(spacing: 15) {
                        Text("Welcome to Night Vale Story")
                            .modifier(ATCTextModifier(font: appConfig.boldFont(size: 25),
                                                      color: .white))
                        Text("by Joseph Fink")
                            .modifier(ATCTextModifier(font: appConfig.regularFont(size: 13),
                                                      color: appConfig.hairlineColor))
                    }.padding()
                    VStack(spacing: 30) {
                        FitnessPlayerProgressBarView(startTime: "00:25", endTime: "05:30")
                        FitnessPlayerControlsView()
                    }.padding(.bottom, 100)
                }
            }
            ATCCustomNavigationBarView(leftIcon: "fitness-back-icon",
                                       leftButtonAction: {
                                        self.mode.wrappedValue.dismiss()
            })
        }.padding(.top, 20)
        .background(Image("fitness-podcast-player-background").resizable())
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct FitnessPodcastPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessPodcastPlayerView()
    }
}

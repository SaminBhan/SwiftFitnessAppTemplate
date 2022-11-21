//
//  FitnessLivePodcastView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessLivePodcastView: View, AppConfigProtocol {
    var body: some View {
        ZStack(alignment: .leading) {
            Image("fitness-podcast-background")
                .resizable()
            VStack(alignment: .leading) {
                Spacer()
                Text("Sleep With Me Bedtime Stories")
                    .multilineTextAlignment(.leading)
                    .modifier(ATCTextModifier(font: appConfig.boldFont(size: 22),
                                              color: .white))
                    
                    .frame(width: 223, height: 68)
                    .padding()
                    .padding(.top, 80)
                VStack(alignment: .leading) {
                    Text("1/4 sections").padding(.leading, 30)
                        .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                        color: .white))
                    Image("fitness-podcast-bar")
                        .frame(height: 20)
                }.padding()
                Spacer()
            }
        }.frame(width: 331, height: 310)
    }
}

struct FitnessLivePodcastView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessLivePodcastView()
    }
}

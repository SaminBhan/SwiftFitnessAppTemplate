//
//  FitnessRewardBoardView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessRewardBoardView: View, AppConfigProtocol {
    
    init() {
        UINavigationBar.appearance().backgroundColor = appConfig.mainThemeBackgroundColor
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                Image("fitness-reward-background")
                VStack(spacing: 15) {
                    VStack(spacing: 2) {
                        Text("My Reward Point")
                            .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                      color: .white))
                        Text("2,500")
                            .modifier(ATCTextModifier(font: appConfig.boldFont(size: 25),
                                                      color: .white))
                    }.padding()
                    HStack(spacing: 20) {
                        ATCAvatarView(image: FitnessMockingData.shared.userList[0].imageIcon, squareLength: 40)
                        VStack(alignment: .center, spacing: 5) {
                            HStack {
                                Text("Silver")
                                    .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                              color: .black))
                                Spacer()
                                Text("Platinum")
                                    .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                              color: .gray))
                            }
                            Image("fitness-reward-progress-bar")
                                .frame(height: 1)
                                .padding(.top)
                        }.frame(width: 235)
                    }
                }
            }
        }
    }
}

struct FitnessRewardBoardView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessRewardBoardView()
    }
}

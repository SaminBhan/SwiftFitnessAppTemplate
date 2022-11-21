//
//  FitnessGoodNightTipsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessGoodNightTipsView: View, AppConfigProtocol {
    @State var pushActive = false
    var body: some View {
        VStack {
            NavigationLink(destination: ATCTabBarView(),
                           isActive: self.$pushActive) {
                            EmptyView()
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .hidden()
            VStack {
                // These lines of code are used to make VStack filled inside the whole screen
                Spacer()
                HStack {
                    Spacer()
                }
                VStack {
                    Image("fitness-tips-goodnight-image").padding(.top, 30)
                    Spacer()
                    VStack(spacing: 20) {
                        Text("Get a good night's sleep, every night")
                            .modifier(ATCTextModifier(font: appConfig.boldFont(size: 25),
                                                      color: .white))
                        Text("Useful Tips : Poor sleep is one of the strongest risk factors for weight gain, so taking care of your sleep is important ")
                            .modifier(ATCTextModifier(font: appConfig.regularFont(size: 13),
                                                      color: appConfig.hairlineColor))
                    }.padding()
                    Spacer()
                    Button(action: {
                        self.pushActive = true
                    }) {
                        Text("Alright!")
                            .modifier(ATCButtonModifier(font: appConfig.mediumBoldFont,
                                                        color: .white,
                                                        textColor: appConfig.mainThemeForegroundColor,
                                                        width: 280,
                                                        height: 50))
                    }.padding(.bottom, 20)
                }.frame(width: 331, height: 472, alignment: .center)
                    .background(Color(appConfig.mainThemeForegroundColor))
                    .cornerRadius(10)
                Spacer()
            }
        }.background(Color.black.opacity(0.8))
            .edgesIgnoringSafeArea(.all)
    }
}

struct FitnessGoodnightTipsView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessGoodNightTipsView()
    }
}

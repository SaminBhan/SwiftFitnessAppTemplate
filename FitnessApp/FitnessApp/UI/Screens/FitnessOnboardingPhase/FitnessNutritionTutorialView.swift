//
//  FitnessNutritionTutorialView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessNutritionTutorialView: View, AppConfigProtocol {
    @State var pushActive = false
    var body: some View {
        VStack {
            NavigationLink(destination: FitnessGoodNightTipsView(),
                           isActive: self.$pushActive) {
                            EmptyView()
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarHidden(true)
            .hidden()
            VStack {
                Spacer()
                VStack {
                    FitnessTargetProcessView(fitnessTracking: FitnessMockingData.shared.trackingTarget[0])
                    Image("fitness-vertical-arrow-image")
                    Text("When you log your meals, your calorie counter will appear here")
                        .frame(width: 213, height: 72)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.white)
                }
                Spacer()
                Button(action: {
                    self.pushActive = true
                }) {
                    Text("Alright, Got It!")
                        .modifier(
                            ATCButtonModifier(font: appConfig.mediumBoldFont,
                                              color: appConfig.mainThemeForegroundColor,
                                              width: 300,
                                              height: 50))
                }.padding(.bottom, 40)
            }
        }.background(Color.black.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
    }
}

struct FitnessNutritionTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessNutritionTutorialView()
    }
}

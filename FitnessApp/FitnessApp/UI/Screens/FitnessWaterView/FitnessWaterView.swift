//
//  FitnessWaterView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessWaterView: View, AppConfigProtocol {
    private var glasses = [true, true, true, false, false, false, false, false]
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            ATCCustomNavigationBarView(leftIcon: "fitness-back-icon",
                                       leftButtonAction: {
                                        self.mode.wrappedValue.dismiss()
            })
            ScrollView {
                VStack(spacing: 20) {
                    HStack { Spacer() }
                    ATCHighlightTextView(originalString: "You have drank 3 glasses today",
                                         highlightString: "3 glasses").frame(width: 180, height: 60)
                        .padding(.bottom)
                    ATCGridView(rows: 2, columns: 4, horizontalAlignment: .leading, rowSpacing: 40, columnSpacing: 45) { row, col in
                        Image(self.glasses[row * 4 + col] ? "fitness-glass-full-icon" : "fitness-glass-empty-icon")
                    }
                    FitnessAllAchievedInformationView(content: [(value: "250 ml", note: "Water Drank"), (value: "8 glasses", note: "Daily Goal")])
                        .frame(height: 55)
                        .background(Color.white)
                    FitnessWarningView(originalString: "You haven't drank much. ", highlightString: "Set reminder")
                    FitnessInsightView(waterInsight: FitnessMockingData.shared.insightWater)
                    VStack {
                        ForEach(FitnessMockingData.shared.trackingTarget, id: \.title) { target in
                            VStack {
                                ATCHealthTrackingInformationView(image: target.image,
                                                                 trackingInformation: target.title,
                                                                 value: "50",
                                                                 subDescription: target.value)
                                ATCSeparatorHorizontalLineView()
                            }.padding(.horizontal )
                        }
                    }
                }
            }
        }.padding(.top, 20)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
        .background(Color(appConfig.mainThemeBackgroundColor))
        .edgesIgnoringSafeArea(.all)
    }
}

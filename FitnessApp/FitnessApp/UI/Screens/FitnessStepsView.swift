//
//  FitnessStepsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessStepsView: View {
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack {
            ATCCustomNavigationBarView(leftIcon: "fitness-back-icon",
                                       leftButtonAction: {
                                        self.mode.wrappedValue.dismiss()
            })
            ScrollView {
                VStack {
                    ATCHighlightTextView(originalString: "You have walked 7,235 steps today",
                                         highlightString: "7,235 steps").frame(width: 220, height: 60)
                    VStack {
                        FitnessVisualGoalView(image: "step-foots-image",
                                              trackingNumber: "10.000",
                                              content: "steps today",
                                              paddingTop: 80,
                                              paddingLead: 0)
                        FitnessAllAchievedInformationView(content: [(value: "1,300 cal", note: "Cal Burned"),
                                                                    (value: "10,000", note: "Daily Goal")])
                            .frame(height: 55)
                        FitnessStatisticView()
                        FitnessInsightView(waterInsight: FitnessMockingData.shared.insightWater)
                        VStack {
                            ForEach(FitnessMockingData.shared.steps, id: \.title) { target in
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
            }
        }.padding(.top, 20)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct FitnessStatisticView: View, AppConfigProtocol {
    var body: some View {
        VStack {
            FitnessDropdownButtonView()
                .padding()
            Image("fitness-statistic-image")
            HStack(spacing: 30) {
                Image("fitness-day-icon")
                Text("6AM").foregroundColor(Color.gray)
                Text("12AM").foregroundColor(Color.gray)
                Text("6PM").foregroundColor(Color.gray)
                Image("fitness-night-icon")
            }
        }
    }
}

struct FitnessStepsView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessStepsView()
    }
}

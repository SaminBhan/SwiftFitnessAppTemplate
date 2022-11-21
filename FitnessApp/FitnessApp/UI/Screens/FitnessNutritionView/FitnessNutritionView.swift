//
//  FitnessNutritionView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessNutritionView: View, AppConfigProtocol {
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    init() {
        UIScrollView.appearance().contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0.0)
    }
    var body: some View {
        VStack {
            ATCCustomNavigationBarView(leftIcon: "fitness-back-icon",
                                       leftButtonAction: {
                                        self.mode.wrappedValue.dismiss()
            })
            ScrollView {
                VStack(spacing: 15) {
                    VStack(spacing: 20) {
                        HStack { Spacer() }
                        ATCHighlightTextView(originalString: "You have consumed 500 cal today",
                                              highlightString: "500 cal").padding(.horizontal, 70)
                        FitnessVisualGoalView(image: "fitness-consumed-image",
                                              trackingNumber: "40%",
                                              content: "of daily goals",
                                              paddingTop: 0,
                                              paddingLead: 22)
                        FitnessNutritionalIngredientsView(trackingNutritions: FitnessMockingData.shared.nutritionIngredients)
                            .padding()
                            .background(Color.white)
                    }.background(Color.white)
                    FitnessNutritiousMealsView(title: "Breakfast",
                                               trackingTargets: FitnessMockingData.shared.trackingTarget)
                    FitnessNutritiousMealsView(title: "Lunch",
                                               trackingTargets: FitnessMockingData.shared.trackingTarget)
                }
            }.background(Color(appConfig.mainThemeBackgroundColor))
                .edgesIgnoringSafeArea(.bottom)
        }.padding(.top, 20)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

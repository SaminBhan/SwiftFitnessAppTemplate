//
//  FitnessNutritionalIngredientsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessNutritionIconView: View {
    let color: UIColor
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color(color))
                .frame(width: 15, height: 15)
                .cornerRadius(4)
        }
    }
}

struct FitnessNutritionalIngredientView: View, AppConfigProtocol {
    let nutritionName: String
    let nutritionalIngredient: String
    let percent: String
    var body: some View {
        HStack {
            FitnessNutritionIconView(color: .random)
            Text(nutritionName)
                .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                         color: .black))
            Spacer()
            Text(nutritionalIngredient)
                .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                                 color: .black))
            Spacer()
            Text(percent)
                .modifier(ATCTextModifier(font: appConfig.boldLargeFont,
                                                   color: .black))
        }
    }
}

struct FitnessNutritionalIngredientsView: View, AppConfigProtocol {
    private let trackingNutritions: [FitnessTrackingProgressProtocol]
    
    init(trackingNutritions: [FitnessTrackingProgressProtocol]) {
        self.trackingNutritions = trackingNutritions
    }
    
    var body: some View {
        VStack {
            ForEach(trackingNutritions, id: \.title) { nutrition in
                VStack {
                    FitnessNutritionalIngredientView(nutritionName: nutrition.title,
                                             nutritionalIngredient: nutrition.value,
                                             percent: nutrition.image)
                    ATCSeparatorHorizontalLineView()
                }.padding(.horizontal )
            }
        }
    }
}

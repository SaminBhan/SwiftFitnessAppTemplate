//
//  FitnessFeedbackView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessFeedbackView: View, AppConfigProtocol {
    @State private var isSelected: Int? = 2
    @Binding var showSheetView: Bool
    var body: some View {
        BaseView(title: "How was your overall experience?",
                 description: "It will help us serve you better",
                 buttonName: "Submit Feedback",
                 isLogoShown: false,
                 actionButton: { self.showSheetView.toggle() }) {
                    VStack {
                        ATCFeedbackEmotionsView(isSelected: $isSelected)
                        ATCFeedbackReasonsView()
                        ATCFeedbackNoteView()
                            .padding(.top, 25)
                    }.padding([.leading, .trailing], 30)
        }
    }
}

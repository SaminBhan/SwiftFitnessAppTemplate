//
//  FitnessSubBaseView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct SubBaseView<Content>: AppConfigProtocol, View where Content: View {
    private let content: Content
    private let buttonName: String
    private let imageDisplay: String
    private let titleContent: String
    private let descriptionContent: String
    private let actionButton: () -> Void
    
    init(buttonName: String = "Save",
         imageDisplay: String,
         titleContent: String,
         descriptionContent: String,
         actionButton: @escaping () -> Void = {},
         @ViewBuilder content: () -> Content) {
        self.content = content()
        self.buttonName = buttonName
        self.titleContent = titleContent
        self.descriptionContent = descriptionContent
        self.imageDisplay = imageDisplay
        self.actionButton = actionButton
    }
    var body: some View {
        BaseView(buttonName: buttonName,
                 isLogoShown: false,
                 actionButton: actionButton) {
                    VStack(alignment: .center) {
                        Image(imageDisplay)
                        VStack(spacing: 20) {
                            Text(titleContent)
                                .modifier(ATCTextModifier(font: appConfig.boldLargeFont,
                                                          color: .black))
                            Text(descriptionContent)
                                .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                          color: .gray))
                                .padding([.leading, .trailing], 20)
                        }.padding(.top, 20)
                    }
                    content
                    Spacer()
        }
    }
}

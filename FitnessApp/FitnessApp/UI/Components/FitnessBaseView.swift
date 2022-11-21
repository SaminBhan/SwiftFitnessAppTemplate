//
//  FitnessBaseView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

protocol AppConfigProtocol {
    var appConfig: FitnessAppConfigurationProtocol { get }
}

extension AppConfigProtocol {
    var appConfig: FitnessAppConfigurationProtocol {
        return FitnessAppConfiguration.shared
    }
}

struct BaseView<Content>: AppConfigProtocol, View where Content: View {
    private let content: Content
    private let title: String?
    private let description: String?
    private let buttonName: String
    private let footerText: String?
    private let footerButtonName: String?
    private let isLogoShown: Bool
    private let backgroundImage: Image?
    private var isStandardButton: Bool = true
    private let actionButton: () -> Void
    @ObservedObject private var keyboard = KeyboardResponder()
    
    init(title: String? = nil,
                description: String? = nil,
                buttonName: String,
                footerText: String? = nil,
                footerButtonName: String? = nil,
                isLogoShown: Bool = true,
                backgroundImage: Image? = nil,
                isStandardButton: Bool = true,
                actionButton: @escaping () -> Void = {},
                @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
        self.description = description
        self.buttonName = buttonName
        self.footerText = footerText
        self.footerButtonName = footerButtonName
        self.isLogoShown = isLogoShown
        self.backgroundImage = backgroundImage
        self.isStandardButton = isStandardButton
        self.actionButton = actionButton
    }
    
    var body : some View {
        VStack {
            if isLogoShown {
                HStack {
                    Spacer()
                    Image("fitness-logo-icon")
                    Spacer()
                }.padding(.top, 60)
            }
            Spacer()
            ATCTitleDescriptionView(title: title,
                                    description: description,
                                    appConfig: appConfig)
                .padding([.leading, .trailing], 30)
            // Make view full of width screen
            HStack { Spacer() }
            content
            Spacer()
            VStack(alignment: .center, spacing: 15) {
                Button(action: {
                    self.actionButton()
                }) {
                    Text(buttonName)
                        .modifier(isStandardButton ?
                            ATCButtonModifier(font: appConfig.mediumBoldFont,
                                              color: appConfig.mainThemeForegroundColor,
                                              width: 300,
                                              height: 50) :
                            ATCButtonModifier(font: appConfig.mediumBoldFont,
                                              color: .white,
                                              textColor: appConfig.mainThemeForegroundColor,
                                              width: 300,
                                              height: 50))
                }
                ATCSubFooterView(subText: footerText,
                                 buttonText: footerButtonName,
                                 appConfig: appConfig).padding(.bottom, 30)
            }
        }.background((backgroundImage != nil) ?
            AnyView(backgroundImage!.resizable().scaledToFill()) :
            AnyView(Color(appConfig.mainThemeBackgroundColor).edgesIgnoringSafeArea(.all)))
            .edgesIgnoringSafeArea(.all)
            .animation(.easeOut(duration: 0.3))
            .onTapGesture {
                self.endEditing(true)
        }
    }
}

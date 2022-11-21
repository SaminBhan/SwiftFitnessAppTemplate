//
//  FitnessOnboardingNotificationView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessOnboardingNotificationBannerView: View, AppConfigProtocol {
    var body: some View {
        HStack(spacing: 14) {
            Image("fitness-logo-icon")
                .resizable()
                .frame(width: 50, height: 50)
            VStack(alignment: .leading, spacing: 7) {
                Text("Momotaro").modifier(ATCTextModifier(font: self.appConfig.mediumBoldFont, color: .black))
                Text("You have achieved your goal!").modifier(ATCTextModifier(font: self.appConfig.regularSmallFont, color: .gray))
            }
        }.padding([.trailing, .leading], 24)
            .padding([.top, .bottom], 12)
            .background(Color.white)
            .cornerRadius(6)
            .modifier(ATCShadowModifier(color: appConfig.shadowColor))
    }
}

struct FitnessOnboardingNotificationCellView: View, AppConfigProtocol {
    let text: String
    let displayBottomLine: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 21) {
            HStack(spacing: 15) {
                Image("fitness-tick-icon")
                Text(text).modifier(ATCTextModifier(font: self.appConfig.regularMediumFont, color: .black))
            }
            if displayBottomLine {
                Rectangle()
                    .fill(Color.gray.opacity(0.4))
                    .frame(height: 1)
            }
        }.padding([.trailing, .leading], 35)
    }
}

struct FitnessOnboardingNotificationDescriptionsView: View, AppConfigProtocol {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            FitnessOnboardingNotificationCellView(text: "New weekly healthy reminder", displayBottomLine: true)
            FitnessOnboardingNotificationCellView(text: "Motivational reminder", displayBottomLine: true)
            FitnessOnboardingNotificationCellView(text: "Personalised program", displayBottomLine: false)
        }
    }
}

struct FitnessOnboardingNotificationView: View, AppConfigProtocol {
    @State var pushActive = false
    var body: some View {
        VStack {
        NavigationLink(destination: FitnessSuccessRegistrationView(),
                       isActive: self.$pushActive) {
                        EmptyView()
        }.hidden()
        .navigationBarTitle("")
        BaseView(title: "Do you want to turn on notification?",
                 buttonName: "Continue",
                 footerButtonName: "Not Now",
                 actionButton: { self.pushActive = true }) {
                    Spacer()
                    ZStack {
                        Image("fitness-half-phone-icon")
                        FitnessOnboardingNotificationBannerView()
                    }
                    FitnessOnboardingNotificationDescriptionsView().padding(.top, 35)
                    Spacer()
            }
        }
    }
}

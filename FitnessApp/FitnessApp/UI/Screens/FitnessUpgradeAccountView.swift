//
//  FitnessUpgradeAccountView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

/// Currently the working mechanism of SwiftUI 1.0 when embedded into UIViewController is different from View protocol. FitnessUpgradeAccountView has been created another View to avoid conflict with ATCUpgradeAccountView

struct FitnessUpgradeAccountView: View, AppConfigProtocol {
    let subscriptionAction: (ATCSubscription?) -> Void
    @State var selectedSubscription: ATCSubscription?
    @Binding var showSheetView: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 60.0) {
            ATCCarouselView(data: appConfig.carouselData,
                            currentPageTintColor: appConfig.mainThemeForegroundColor)
            ATCUpgradeAccountConsumerTypesView(selectedSubscription: $selectedSubscription,
                                               appConfig: appConfig,
                                               uiConfig: appConfig) {
                                                self.subscriptionAction(self.appConfig.freeTrialSubscription)
            }
            ATCUpgradeAccountBottomView(selectedSubscription: $selectedSubscription,
                                        uiConfig: appConfig) {
                                            self.showSheetView.toggle()
                                            self.subscriptionAction(self.selectedSubscription)
            }
        }.padding(.bottom, 20)
    }
}

//
//  FitnessSettingView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplate. All rights reserved.
//

import SwiftUI

struct FitnessSettingView: View {
    
    @State private var showSheetView = false
    @State private var selectedSetting: SettingModel?
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack {
            ATCCustomNavigationBarView(title: "Settings",
                                       leftIcon: "fitness-back-icon",
                                       leftButtonAction: {
                                        self.mode.wrappedValue.dismiss()
            })
            List {
                ForEach(FitnessAppConfiguration.shared.settings, id: \.self) { setting in
                    ATCTextAndToggleView(text: setting.text,
                                         isToggleShown: setting.isToggleShown,
                                         useThemeColor: setting.useThemeColor).onTapGesture {
                                            self.showSheetView = true
                                            self.selectedSetting = setting
                    }
                }.padding()
                .environment(\.defaultMinListRowHeight, 54)
            }
        }
        .sheet(isPresented: $showSheetView) {
            self.expectedSheetView(setting: self.selectedSetting)
        }.padding(.top, 20)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension FitnessSettingView {
    func expectedSheetView(setting: SettingModel?) -> AnyView? {
        guard let setting = setting else { return nil }
        switch setting.text {
        case "Invite Friend":
            return AnyView(FitnessInviteFriendView(showSheetView: $showSheetView))
        case "Notification":
            return AnyView(FitnessNotificationListView())
        case "Set Weight Reminder":
            return AnyView(FitnessWeightReminderView(showSheetView: $showSheetView))
        case "Set Sleep Reminder":
            return AnyView(FitnessSleepReminderView(showSheetView: $showSheetView))
        case "Give Feedback":
            return AnyView(FitnessFeedbackView(showSheetView: $showSheetView))
        default:
           return nil
        }
    }
}

struct FitnessSettingView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessSettingView()
    }
}

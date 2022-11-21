//
//  FitnessSleepReminderView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessSleepReminderView: View, AppConfigProtocol {
    @State var isMondayChecked: Bool = false
    @State private var birthDate = Date()
    @Binding var showSheetView: Bool
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
        SubBaseView(imageDisplay: "fitness-sleep-reminder-img",
                    titleContent: "What time would you like to sleep?",
                    descriptionContent: "Sets a reminder to alert you at what point you should go to sleep.",
                    actionButton: { self.showSheetView.toggle() }) {
                        DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .hourAndMinute) {
                            EmptyView()
                        }.labelsHidden()
                        .padding()
                        VStack {
                            ATCSeparatorHorizontalLineView()
                            ATCTextAndToggleView(text: "Add alarm sound",
                                                 isToggleShown: true,
                                                 useThemeColor: false)
                        }.padding()
        }
    }
}

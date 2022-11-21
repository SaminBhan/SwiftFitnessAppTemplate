//
//  FitnessWeightReminderView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessWeightReminderView: View, AppConfigProtocol {
    @State var isMondayChecked: Bool = false
    @State var isTuesdayChecked: Bool = false
    @State var isWednesdayChecked: Bool = false
    @State var isThursdayChecked: Bool = false
    @State var isFridayChecked: Bool = false
    @State var isSaturdayChecked: Bool = false
    @State var isSundayChecked: Bool = false
    @Binding var showSheetView: Bool
    private let dates = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    init(showSheetView: Binding<Bool>) {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self._showSheetView = showSheetView
    }
    
    var body: some View {
        SubBaseView(imageDisplay: "fitness-weight-reminder-icon",
                    titleContent: "Weight Reminder",
                    descriptionContent: "Choose a day to weigh yourself and we will send you the reminder",
                    actionButton: { self.showSheetView.toggle() }) {
                        List {
                            Section {
                                ATCCheckboxView(isChecked: $isMondayChecked, content: dates[0], isCheckBoxRight: true)
                                ATCCheckboxView(isChecked: $isTuesdayChecked, content: dates[1], isCheckBoxRight: true)
                                ATCCheckboxView(isChecked: $isWednesdayChecked, content: dates[2], isCheckBoxRight: true)
                                ATCCheckboxView(isChecked: $isThursdayChecked, content: dates[3], isCheckBoxRight: true)
                                ATCCheckboxView(isChecked: $isFridayChecked, content: dates[4], isCheckBoxRight: true)
                                ATCCheckboxView(isChecked: $isSaturdayChecked, content: dates[5], isCheckBoxRight: true)
                                ATCCheckboxView(isChecked: $isSundayChecked, content: dates[6], isCheckBoxRight: true)
                            }
                        }.listStyle(GroupedListStyle())
                            .environment(\.horizontalSizeClass, .regular)
        }.padding(.top, 40)
    }
}


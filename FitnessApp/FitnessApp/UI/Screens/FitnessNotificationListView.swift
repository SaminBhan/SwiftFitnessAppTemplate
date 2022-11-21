//
//  FitnessNotificationListView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessNotificationListView: View, AppConfigProtocol {
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(FitnessMockingData.shared.getNotificationList, id: \.notificationId) { setting in
                    ATCNotificationCellView(notificationPayload: setting)
                }
            }
            .padding()
            .navigationBarTitle(Text("Notification"))
        }.background(Color(appConfig.mainThemeBackgroundColor))
    }
}

struct FitnessNotificationListView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessNotificationListView()
    }
}

//
//  FitnessJournalView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessJournalView: View, AppConfigProtocol {
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    var body: some View {
        VStack {
            FitnessTitleContainerView(title: "Journal",
                                      font: appConfig.boldFont(size: 20),
                                      isNeedMoreOption: true)
                .padding([.top, .leading, .trailing])
            List {
                ForEach(0..<FitnessMockingData.shared.journal.count) { ind in
                    HStack {
                        Text(FitnessMockingData.shared.journal[ind].0)
                        Spacer()
                        Text(FitnessMockingData.shared.journal[ind].1)
                    }
                }.listRowBackground(Color.clear)
            }
        }.background(Color.clear)
    }
}

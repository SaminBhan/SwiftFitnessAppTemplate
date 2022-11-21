//
//  FitnessInviteFriendView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessInviteFriendView: View, AppConfigProtocol {
    // MARK: - Private data
    private struct Data: Hashable {
        let text: String
        let content: String
    }
    private var data: [Data] = [Data(text: "Invites sent", content: "10 invites"),
                                Data(text: "Accepted", content: "1 invite"),
                                Data(text: "Earning", content: "$5.00")]
    @Binding var showSheetView: Bool
    // MARK: - Init function
    init(showSheetView: Binding<Bool>) {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().backgroundColor = UIColor.clear
        self._showSheetView = showSheetView
    }
    
    var body: some View {
        BaseView(buttonName: "Invite Now",
                 isLogoShown: false,
                 actionButton: { self.showSheetView.toggle() }) {
                    VStack(spacing: 25) {
                        Image("fitness-illustration")
                        VStack(alignment: .center, spacing: 15) {
                            ATCTitleDescriptionView(title: "Refer friends and you’ll each get $5",
                                                    description: "Each time a friend signs up through your refereral link and open account we’ll reward you both $5",
                                                    appConfig: appConfig)
                        }.padding()
                        CopyLinkView()
                        List {
                            ForEach(data, id: \.self) { data in
                                HStack {
                                    Text(data.text)
                                    Spacer()
                                    Text(data.content)
                                }.listRowBackground(Color(self.appConfig.mainThemeBackgroundColor))
                            }
                        }.frame(height: 162)
                    }.padding()
                        .environment(\.defaultMinListRowHeight, 54)
        }
    }
}

struct CopyLinkView: View, AppConfigProtocol {
    var body: some View {
        HStack {
            Text("https://mmtr.com/sd45d")
                .modifier(ATCTextModifier(font: appConfig.mediumBoldFont,
                                          color: appConfig.mainThemeForegroundColor))
            Spacer()
            Image("fitness-copy-icon")
        }.padding()
            .background(Color(appConfig.mainSubtextColor))
            .cornerRadius(25)
    }
}

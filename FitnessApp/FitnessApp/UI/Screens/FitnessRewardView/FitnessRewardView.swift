//
//  FitnessRewardView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessRewardView: View, AppConfigProtocol, ATCDrawerMenuItemProtocol {
    @State private var selectionType: SelectionType = .none
    @State var pushActive = false
    @State var openDrawer = false
    
    private enum SelectionType {
        case drawerItem(indexDrawerItem: Int)
        case none
    }
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: getDestinationWithContainerView(),
                               isActive: self.$pushActive) {
                                EmptyView()
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarHidden(true)
                .hidden()
                FitnessDrawerBaseView(user: FitnessMockingData.shared.userList[0],
                                      openDrawer: $openDrawer, completion: { result in
                                        self.selectionType = .drawerItem(indexDrawerItem: result)
                                        self.pushActive = true
                }) {
                    VStack {
                        ATCCustomNavigationBarView(title: "Reward",
                                                   leftButtonAction: { self.openDrawer.toggle() })
                        ScrollView {
                            Spacer()
                            FitnessRewardBoardView()
                                .padding(.top, 40)
                                .cornerRadius(10)
                            VStack(spacing: 20) {
                                FitnessQuickBannerView(content: "You have 1 unused voucher",
                                                       buttonName: "Use")  {}
                                FitnessRewardTipsView()
                            }
                            Spacer()
                        }
                    }.padding(.top, 20)
                    .background(Color(appConfig.mainThemeBackgroundColor))
                    .edgesIgnoringSafeArea(.all)
                }
            }
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
    
    func getDestinationWithContainerView() -> AnyView? {
        switch selectionType {
        case .drawerItem(let index):
            return AnyView(getDestinationFromDrawerView(with: index))
        default:
            return nil
        }
    }
}

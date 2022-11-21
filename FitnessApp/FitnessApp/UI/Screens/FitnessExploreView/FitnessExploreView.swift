//
//  FitnessExploreView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessExploreView: View, AppConfigProtocol, ATCDrawerMenuItemProtocol {
    @State private var selectionType: SelectionType = .none
    @State var pushActive = false
    @State var openDrawer = false
    
    private enum SelectionType {
        case drawerItem(indexDrawerItem: Int)
        case none
    }
    
    var body: some View {
        NavigationView {
            ZStack {
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
                            ATCCustomNavigationBarView(title: "Explore",
                                                       leftButtonAction: { self.openDrawer.toggle() })
                            ScrollView {
                                    Color(appConfig.mainThemeBackgroundColor).edgesIgnoringSafeArea(.all)
                                    VStack(spacing: 15) {
                                        VStack(spacing: 15) {
                                            ATCSearchTextFieldView()
                                            ATCArticlesView(fitnessArticles: FitnessMockingData.shared.articles)
                                        }.padding(.horizontal, 20)
                                        FitnessTopTopicsView()
                                        ATCSubContentListView(title: "Get Inspired", subContents: FitnessMockingData.shared.inspirations)
                                    }.padding(.vertical)
                            }
                        }.padding(.top, 20)
                        .edgesIgnoringSafeArea(.all)
                    }
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

struct FitnessExploreView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessExploreView()
    }
}

//
//  FitnessPodcastView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessPodcastView: View, AppConfigProtocol, ATCDrawerMenuItemProtocol {
    @State private var selectionType: SelectionType = .none
    @State var openDrawer = false
    @State var pushActive = false
    @State var showSheetView = false
    
    private enum SelectionType {
        case drawerItem(indexDrawerItem: Int)
        case podcastDetails
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
                                            ATCCustomNavigationBarView(title: "Podcasts",
                                                                       leftButtonAction: { self.openDrawer.toggle() })
                                            ScrollView {
                                                VStack {
                                                    FitnessLivePodcastView().onTapGesture {
                                                        self.selectionType = .podcastDetails
                                                        self.pushActive = true
                                                    }
                                                    FitnessQuickBannerView(content: "Unlimited access for premium!",
                                                                           buttonName: "Buy") { self.showSheetView.toggle() }
                                                    FitnessCategoryPodcastsView(title: "Wellness", dataSource: FitnessMockingData.shared.mockingWellness)
                                                    FitnessCategoryPodcastsView(title: "Meditation", dataSource: FitnessMockingData.shared.mockingMeditation)
                                                    CarouselContentView(title: "You may also like") {
                                                        FitnessSuggestionPodcastView()
                                                            .background(Color.white)
                                                            .cornerRadius(10)
                                                            .modifier(ATCShadowModifier(color: self.appConfig.shadowColor))
                                                    }
                                                }
                                            }
                                        }.padding(.top, 20)
                                            .background(Color(appConfig.mainThemeBackgroundColor))
                                            .edgesIgnoringSafeArea(.all)
                }
            }.sheet(isPresented: $showSheetView) {
            FitnessUpgradeAccountView(subscriptionAction: self.subscriptionAction,
                                      showSheetView: self.$showSheetView)
            }
        }
    }
    
    func getDestinationWithContainerView() -> AnyView? {
        switch selectionType {
        case .drawerItem(let index):
            return AnyView(getDestinationFromDrawerView(with: index))
        case .podcastDetails:
            return AnyView(FitnessPodcastDetailsView())
        default:
            return nil
        }
    }
    
    private func subscriptionAction(selectedSubscription: ATCSubscription?) {}
}

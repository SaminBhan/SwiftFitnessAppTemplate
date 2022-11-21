//
//  FitnessMyProfileProgressView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessMyProfileProgressView: View, AppConfigProtocol, ATCDrawerMenuItemProtocol {
    @State private var selectionType: SelectionType = .none
    @State private var pushActive = false
    @State private var openDrawer = false
    @State private var showSheetView = false
    
    private enum SelectionType {
        case drawerItem(indexDrawerItem: Int)
        case settingView
        case targetDetail(data: FitnessTrackingProgressProtocol)
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
                        ATCCustomNavigationBarView(title: "My Profile",
                                                   rightIcon: .standardIcon(image: "fitness-settings-icon"),
                                                   leftButtonAction: { self.openDrawer.toggle() }) {
                                                    self.selectionType = .settingView
                                                    self.pushActive = true
                        }
                        ScrollView {
                            VStack {
                                FitnessQuickBannerView(content: "Unlimited access for premium!", buttonName: "Buy") {
                                    self.showSheetView.toggle()
                                }
                                FitnessMyProfileProgressInfoView(completion: { result in
                                    self.selectionType = .targetDetail(data: result)
                                    self.pushActive = true
                                }).padding(.horizontal, 20)
                                Spacer()
                                FitnessBadgesView()
                                    .padding(.top, 300)
                                    .padding(.horizontal, 20)
                            }
                        }
                    }
                }.padding(.top, 20)
                .edgesIgnoringSafeArea(.all)
            }.sheet(isPresented: $showSheetView) {
                FitnessUpgradeAccountView(subscriptionAction: self.subscriptionAction,
                                          showSheetView: self.$showSheetView)
            }
        }
        .background(Color(appConfig.mainThemeBackgroundColor))
    }
    
    func getDestinationWithContainerView() -> AnyView? {
        switch selectionType {
        case .drawerItem(let index):
            return AnyView(getDestinationFromDrawerView(with: index))
        case .targetDetail(let data):
            guard let dataType = data.trackingInformationType else { return nil }
            return getDestinationWithInformationType(dataType)
        case .settingView:
            return AnyView(FitnessSettingView())
        default:
            return nil
        }
    }
    
    func getDestinationWithInformationType(_ type: TrackingInformationType) -> AnyView {
        switch type {
        case .nutrition:
            return AnyView(FitnessNutritionView())
        case .water:
            return AnyView(FitnessWaterView())
        case .steps:
            return AnyView(FitnessStepsView())
        case .weight:
            return AnyView(FitnessProfileProgressView())
        }
    }
    
    private func subscriptionAction(selectedSubscription: ATCSubscription?) {}
}

struct FitnessMyProfileProgressInfoView: View, AppConfigProtocol {
    
    let completion: (FitnessTrackingProgressProtocol) -> Void
    
    init(completion: @escaping (FitnessTrackingProgressProtocol) -> Void) {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = .clear
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            FitnessTitleContainerView(title: "My Goal",
                                      font: appConfig.boldFont(size: 20),
                                      isNeedMoreOption: true)
            VStack {
                ForEach(FitnessMockingData.shared.trackingData, id: \.title) { informationData in
                    VStack {
                        ATCHealthTrackingInformationView(image: informationData.image,
                                                         trackingInformation: informationData.title,
                                                         value: informationData.value)
                            .frame(height: 55)
                        ATCSeparatorHorizontalLineView()
                    }.onTapGesture {
                        self.completion(informationData)
                    }
                }.listRowBackground(Color.clear)
            }
            ATCLineChartView(data: [60,40,60,45,80,1],
                             style: ChartStyle(backgroundColor: Color.white,
                                               textColor: Color.black,
                                               chartBoardTextColor: Color.gray,
                                               dropShadowColor: Color.gray))
        }
    }
}

struct FitnessMyProfileProgressView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessMyProfileProgressView()
    }
}

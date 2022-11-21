//
//  FitnessHomeView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessHomeView: View, AppConfigProtocol, ATCDrawerMenuItemProtocol {
    @State private var selectionType: SelectionType = .none
    @State var openDrawer = false
    @State var pushActive = false
    
    private enum SelectionType {
        case drawerItem(indexDrawerItem: Int)
        case targetDetail(data: FitnessTrackingProgressProtocol)
        case none
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: AnyView(getDestinationWithContainerView()),
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
                        ATCCustomNavigationBarView(title: "Good Morning,",
                                                   subTitle: "Grace",
                                                   rightIcon: .avatar(user: FitnessMockingData.shared.userList[0]),
                                                   leftButtonAction: { self.openDrawer.toggle() })
                        ScrollView {
                            VStack {
                                VStack(alignment: .leading, spacing: 15) {
                                    Text("Eat the right amount of food and stay hydrated throught the day")
                                        .multilineTextAlignment(.leading)
                                        .modifier(ATCTextModifier(font: self.appConfig.regularMediumFont,
                                                                  color: .black))
                                    Text("More details")
                                        .modifier(ATCTextModifier(font: self.appConfig.mediumBoldFont,
                                                                  color: self.appConfig.mainThemeForegroundColor))
                                }.padding(.horizontal)
                                Spacer()
                                VStack {
                                    ForEach(FitnessMockingData.shared.trackingTarget, id: \.title) { informationData in
                                        FitnessTargetProcessView(fitnessTracking: informationData)
                                            .onTapGesture {
                                                self.selectionType = .targetDetail(data: informationData)
                                                self.pushActive = true
                                            }
                                    }
                                }
                                Spacer()
                                HStack { Spacer() }
                            }
                        }
                    }.padding(.top, 20)
                        .background(Color(appConfig.mainThemeBackgroundColor))
                        .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
    
    func getDestinationWithContainerView() -> AnyView? {
        switch selectionType {
        case .drawerItem(let index):
            return AnyView(getDestinationFromDrawerView(with: index))
        case .targetDetail(let data):
            guard let dataType = data.trackingInformationType else { return nil }
            return getDestinationWithInformationType(dataType)
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
}

struct FitnessHomeView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessHomeView()
    }
}

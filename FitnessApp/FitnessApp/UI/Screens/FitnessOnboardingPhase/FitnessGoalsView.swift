//
//  FitnessGoalsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessGoalsView: View, AppConfigProtocol {
    @State var isFirstSelected: Bool = true
    @State var isSecondSelected: Bool = false
    @State var isThirdSelected: Bool = false
    @State var isFourthSelected: Bool = false
    @State var pushActive = false
    
    init() {
        UIScrollView.appearance().contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 40, right: 0.0)
    }
    
    var body: some View {
        VStack {
            NavigationLink(destination: FitnessInterestsView(),
                           isActive: self.$pushActive) {
                            EmptyView()
            }.hidden()
            .navigationBarTitle("")
            GeometryReader { geometry in
                ScrollView {
                    BaseView(title: "Let us know how we can help you",
                             description: "You always can change this later",
                             buttonName: "Continue",
                             actionButton: {
                                self.pushActive = true
                    }) {
                        Spacer()
                        VStack(alignment: .center, spacing: 15) {
                            ATCSelectionView(isChecked: self.$isFirstSelected, content: "Weight loss")
                            ATCSelectionView(isChecked: self.$isSecondSelected, content: "Better sleeping habit")
                            ATCSelectionView(isChecked: self.$isThirdSelected, content: "Track my nutrition")
                            ATCSelectionView(isChecked: self.$isFourthSelected, content: "Improve overall fitness")
                        }.padding([.trailing, .leading], 22)
                        Spacer()
                    }.frame(width: geometry.size.width,
                            height: geometry.size.height,
                            alignment: .center)
                }
            }.edgesIgnoringSafeArea(.all)
        }
    }
}

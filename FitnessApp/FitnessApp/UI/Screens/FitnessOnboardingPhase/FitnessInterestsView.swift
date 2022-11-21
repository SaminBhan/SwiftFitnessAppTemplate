//
//  FitnessInterestsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct Interest {
    let id: Int
    let title: String
    let image: String
}

struct SingleInterestView: View, AppConfigProtocol {
    let interest: Interest
    let colorCirle: Color
    
    init(interest: Interest, colorCirle: Color = Color.white) {
        self.interest = interest
        self.colorCirle = colorCirle
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(colorCirle)
                    .frame(width: 72, height: 72)
                Image(interest.image)
                    .resizable()
                    .frame(width: 23, height: 23)
            }
            Text(interest.title)
                .modifier(ATCTextModifier(font: appConfig.regularSmallFont,
                                          color: appConfig.colorGray0))
        }
    }
}

struct FitnessInterestsView: View, AppConfigProtocol {
    init() {
        UIScrollView.appearance().contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 40, right: 0.0)
    }
    @State var pushActive = false
    var body: some View {
        VStack {
            NavigationLink(destination: FitnessGenderSeletionView(),
                           isActive: self.$pushActive) {
                            EmptyView()
            }
            .hidden()
            .navigationBarTitle("")
            GeometryReader { geometry in
                ScrollView {
                    BaseView(title: "Time to customize your interests",
                             buttonName: "Continue",
                             actionButton: { self.pushActive = true }) {
                                Spacer()
                                ATCGridView(rows: 3, columns: 3, rowSpacing: 40, columnSpacing: 30) { row, col in
                                    SingleInterestView(interest: self.appConfig.interests[row * 3 + col])
                                }
                                Spacer()
                    }.frame(width: geometry.size.width,
                            height: geometry.size.height,
                            alignment: .center)
                }
            }
            Spacer()
        }.edgesIgnoringSafeArea(.all)
    }
}

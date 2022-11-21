//
//  FitnessProfileProgressView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessProfileProgressResultView: View, AppConfigProtocol {
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Image("fitness-congrat-icon")
                ATCHighlightTextView(originalString: "Good job! You have a 10% weight loss compare to last month",
                                      highlightString: "10% weight loss",
                                      fontOriginalSize: UIFont(name: "Rubik-Regular", size: 16)!,
                                      fontHighlightSize: UIFont(name: "Rubik-Medium", size: 16)!)
                    .frame(width: 300, height: 40, alignment: .center)
            }.padding(.horizontal)
        }
    }
}

struct FitnessProfileProgressView: View, AppConfigProtocol {
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = appConfig.mainThemeBackgroundColor
    }
    
    var body: some View {
        VStack {
            ATCCustomNavigationBarView(title: "Progress",
                                       leftIcon: "fitness-back-icon",
                                       leftButtonAction: {
                                        self.mode.wrappedValue.dismiss()
            })
            ScrollView {
                BaseView(buttonName: "Update Weight",
                         isLogoShown: false) {
                            VStack {
                                FitnessTargetTrackingView().background(Color.clear)
                                FitnessProfileProgressResultView().padding(.top, 60)
                                FitnessJournalView().frame(height: 200, alignment: .center)
                            }
                }
            }
        }.padding(.top, 20)
        .background(Color(appConfig.mainThemeBackgroundColor))
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct FitnessProfileProgressView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessProfileProgressView()
    }
}

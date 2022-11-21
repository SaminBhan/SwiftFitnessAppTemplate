//
//  FitnessPodcastDetailsView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessPodcastDetailsView: View, AppConfigProtocol {
    @State var pushActive = false
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    init() {
        UIScrollView.appearance().contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 40, right: 0.0)
    }
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: FitnessPodcastPlayerView(),
                               isActive: self.$pushActive) {
                                EmptyView()
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarHidden(true)
                .hidden()
                VStack {
                    ATCCustomNavigationBarView(leftIcon: "fitness-back-icon",
                                               leftButtonAction: {
                                                self.mode.wrappedValue.dismiss()
                    })
                    ScrollView {
                        VStack {
                            FitnessPodcastDetailContentView() {
                                self.pushActive = true
                            }
                                .background(Color.white)
                            ATCSubContentListView(title: "4 Sessions", subContents: FitnessMockingData.shared.sessions)
                            ATCCommentsView(title: "Reviews",
                                            comments: FitnessMockingData.shared.commentList,
                                            isNeedRating: true).background(Color.white)
                        }
                    }
                }
            }.padding(.top, 20)
            .background(Color(appConfig.mainThemeBackgroundColor))
            .edgesIgnoringSafeArea(.all)
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

struct FitnessPodcastDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessPodcastDetailsView()
    }
}

//
//  FitnessWalkthoughView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessWalkthoughView: View, AppConfigProtocol {
    var pages: [UIViewController]
    var titles: [String]
    var descriptions: [String]
    @State var currentPageIndex = 0
    @State var pushActive = false
    
    init() {
        let appConfig = FitnessAppConfiguration.shared
        self.pages = appConfig.walkthroughData.compactMap { (model) -> UIViewController in
            let vc = UIHostingController(rootView: ATCPageView(image: model.image))
            vc.view.backgroundColor = .clear
            return vc
        }
        self.titles = appConfig.walkthroughData.map { $0.title }
        self.descriptions = appConfig.walkthroughData.map { $0.description }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: FitnessInformationView(informationType: .phoneNumber),
                               isActive: self.$pushActive) {
                                EmptyView()
                }.hidden()
                .navigationBarTitle("")
                BaseView(title: titles[currentPageIndex],
                         description: descriptions[currentPageIndex],
                         buttonName: "Get Started",
                         footerText: "Already have account?",
                         footerButtonName: "Sign in", actionButton: {
                            self.pushActive = true
                }) {
                    ATCPageViewController(currentPageIndex: $currentPageIndex, viewControllers: pages)
                    ATCPageControlView(numberOfPages: pages.count,
                                       currentPageTintColor: appConfig.mainThemeForegroundColor,
                                       currentPageIndex: $currentPageIndex)
                }
            }
        }
    }
}
struct FitnessWalkthoughView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessWalkthoughView()
    }
}

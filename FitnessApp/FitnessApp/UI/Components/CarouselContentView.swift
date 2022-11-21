//
//  CarouselContentView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct CarouselContentView<Content>: AppConfigProtocol, View where Content: View {
    private let content: Content
    private let title: String
    private let isNeedMoreOption: Bool
    init(title: String,
         isNeedMoreOption: Bool = true,
         @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
        self.isNeedMoreOption = isNeedMoreOption
        UIScrollView.appearance().contentOffset.y = 0.0
    }
    
    var body: some View {
        VStack {
            FitnessTitleContainerView(title: title,
                                      font: appConfig.boldFont(size: 20),
                                      isNeedMoreOption: isNeedMoreOption)
                .padding([.top, .leading, .trailing])
            ScrollView(.horizontal, content: {
                HStack(spacing: 15) {
                    content
                }.padding(.bottom)
            }).padding([.leading, .top, .bottom])
        }.background(Color.white)
    }
}

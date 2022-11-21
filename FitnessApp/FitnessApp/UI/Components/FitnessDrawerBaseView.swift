//
//  FitnessDrawerBaseView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessDrawerBaseView<Content>: AppConfigProtocol, View where Content: View {
    private let content: Content
    private let user: FitnessUserProtocol
    @Binding var openDrawer: Bool
    var completion: (Int) -> Void
    init(user: FitnessUserProtocol,
         openDrawer: Binding<Bool>,
          completion: @escaping (Int) -> Void,
         @ViewBuilder content: () -> Content) {
        self.user = user
        self._openDrawer = openDrawer
        self.content = content()
        self.completion = completion
    }
    
    var body: some View {
        ZStack {
            content
            if openDrawer {
                Color(.lightGray).padding(.trailing, 80)
                    .offset(x: openDrawer ? 0 : -UIScreen.main.bounds.width)
                    .rotation3DEffect(Angle(degrees: openDrawer ? 0 : 45), axis: (x: 0, y: 20, z: 0))
                    .animation(.default)
                    .edgesIgnoringSafeArea(.top)
                ATCDrawerMenuView(openDrawer: $openDrawer,
                                  user: user,
                                  completion: completion)
            }
        }
    }
}

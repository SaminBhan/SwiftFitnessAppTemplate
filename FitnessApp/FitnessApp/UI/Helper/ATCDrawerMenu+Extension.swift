//
//  ATCDrawerMenu+Extension.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

protocol ATCDrawerMenuItemProtocol {
    func getDestinationWithContainerView() -> AnyView?
    func getDestinationFromDrawerView(with index: Int) -> AnyView?
}

extension ATCDrawerMenuItemProtocol {
    func getDestinationFromDrawerView(with index: Int) -> AnyView? {
        switch index {
        case 1:
            return AnyView(FitnessExploreView())
        case 2:
            return AnyView(FitnessRewardView())
        case 3:
            return AnyView(FitnessSharePlaylistView())
        case 4:
            return AnyView(FitnessShareAchievedResultView())
        case 5:
            let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene
            if let windowScenedelegate = scene?.delegate as? SceneDelegate {
               let window = UIWindow(windowScene: scene!)
               window.rootViewController = UIHostingController(rootView:FitnessWalkthoughView())
               windowScenedelegate.window = window
               window.makeKeyAndVisible()
            }
            return nil
        default:
            return nil
        }
    }
}

enum SeletionTypeWithDrawer {
    case drawerItem(indexDrawerItem: Int)
    case none
}

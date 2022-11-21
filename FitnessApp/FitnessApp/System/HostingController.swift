//
//  HostingController.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

class HostingController<Content>: UIHostingController<Content> where Content : View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
}

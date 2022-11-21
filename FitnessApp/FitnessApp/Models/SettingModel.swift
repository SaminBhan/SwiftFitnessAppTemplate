//
//  SettingModel.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct SettingModel : Hashable {
    var text: String
    var isToggleShown: Bool
    var useThemeColor: Bool
    
    init(text: String, isToggleShown: Bool = false, useThemeColor: Bool = false) {
        self.text = text
        self.isToggleShown = isToggleShown
        self.useThemeColor = useThemeColor
    }
}

//
//  FitnessAppConfigurationProtocol.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import UIKit

protocol FitnessAppConfigurationProtocol: ATCUIGenericConfigurationProtocol, ATCUpgradeAccountConfigurationUIProtocol {
    var walkthroughData: [ATCCarouselModel] {get}
    var interests: [Interest] {get}
    var shadowColor: UIColor {get}
}

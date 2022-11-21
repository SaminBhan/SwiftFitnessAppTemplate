//
//  FitnessQuickContent.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

protocol FitnessQuickContentProtocol {
    var id: Int { get }
    var title: String { get }
    var subTitle: String { get }
    var image: String { get }
}

struct FitnessQuickContent: FitnessQuickContentProtocol {
    var id: Int
    var title: String
    var subTitle: String
    var image: String
}

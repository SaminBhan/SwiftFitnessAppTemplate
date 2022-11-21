//
//  FitnessHighlightEventProtocol.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

protocol FitnessHighlightEventProtocol {
    var title: String { get }
    var description: String { get }
    var image: String { get }
    var attendees: [FitnessUserProtocol] { get }
}

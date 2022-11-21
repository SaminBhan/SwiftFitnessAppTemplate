//
//  FitnessHighlightEvent.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

struct FitnessHighlightEvent: FitnessHighlightEventProtocol {
    var title: String
    var description: String
    var image: String
    var attendees: [FitnessUserProtocol]
}

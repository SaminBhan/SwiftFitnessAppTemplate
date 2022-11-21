//
//  FitnessNearbyEventProtocol.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

protocol FitnessNearbyEventProtocol {
    // Update later: Use date to convert to month/ day
    var month: String { get }
    var day: String { get }
    var title: String { get }
    var eventDescription: String { get }
}

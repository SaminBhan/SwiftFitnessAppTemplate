//
//  FitnessTrackingProgress.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation
enum TrackingInformationType {
    case nutrition
    case steps
    case water
    case weight
}

protocol FitnessTrackingProgressProtocol {
    var title: String { get }
    var value: String { get }
    var image: String { get }
    var isWarning: Bool { get }
    var trackingInformationType: TrackingInformationType? { get }
}

struct FitnessTrackingProgress: FitnessTrackingProgressProtocol {
    var title: String
    var value: String
    var image: String
    var isWarning: Bool = false
    var trackingInformationType: TrackingInformationType? = nil
}

//
//  FitnessSongProtocol.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

protocol FitnessSongProtocol {
    var songId: String { get }
    var name: String { get }
    var singer: String { get }
    var category: FitnessArticleCategory { get }
    var duration: String { get }
}

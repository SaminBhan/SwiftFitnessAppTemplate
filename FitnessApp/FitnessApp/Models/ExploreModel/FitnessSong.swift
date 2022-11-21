//
//  FitnessSong.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

struct FitnessSong: FitnessSongProtocol {
    var songId: String
    var name: String
    var singer: String
    var category: FitnessArticleCategory
    var duration: String
}

//
//  FitnessInspiration.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

struct SubContentModel: SubContentModelProtocol {
    var id: Int
    var title: String
    var image: String
    var category: FitnessArticleCategory
    var numericalOrder: String?
}

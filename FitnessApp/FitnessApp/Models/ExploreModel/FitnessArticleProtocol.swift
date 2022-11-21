//
//  FitnessArticleProtocol.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

enum FitnessArticleCategory: String {
    case health = "Health"
    case meditation = "Meditation"
    case nutrition = "Nutrition"
    var content: String {
        self.rawValue
    }
}

protocol FitnessArticleProtocol {
    var articleId: Int { get }
    var title: String { get }
    var author: String { get }
    var image: String { get }
    var category: FitnessArticleCategory { get }
    var time: String { get }
}

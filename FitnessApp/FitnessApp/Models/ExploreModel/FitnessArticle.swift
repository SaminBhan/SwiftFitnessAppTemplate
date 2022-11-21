//
//  FitnessArticle.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

struct FitnessArticle: FitnessArticleProtocol {
    var articleId: Int
    var title: String
    var author: String
    var image: String
    var category: FitnessArticleCategory
    var time: String
}

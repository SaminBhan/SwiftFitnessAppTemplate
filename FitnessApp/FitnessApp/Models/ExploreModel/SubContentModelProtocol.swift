//
//  FitnessInspirationProtocol.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

protocol SubContentModelProtocol {
    var id: Int { get }
    var title: String { get }
    var image: String { get }
    var category: FitnessArticleCategory { get }
    var numericalOrder: String? { get }
}

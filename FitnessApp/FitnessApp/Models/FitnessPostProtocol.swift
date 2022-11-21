//
//  FitnessPostProtocol.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

protocol FitnessPostProtocol {
    var postId: Int { get }
    var userId: Int { get }
    var content: String? { get }
    var postTime: String { get }
    var hashtag: String? { get }
    var image: String? { get }
    var numberOfLikes: String? { get }
    var numberOfComments: String? { get }
    var postType: PostType { get }
}

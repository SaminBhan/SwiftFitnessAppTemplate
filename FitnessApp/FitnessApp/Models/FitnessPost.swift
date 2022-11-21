//
//  FitnessPost.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

enum PostType {
    case normalPost, event, challenge
}

struct FitnessPost: FitnessPostProtocol {
    var postId: Int
    var userId: Int
    var content: String? = nil
    var hashtag: String? = nil
    var image: String? = nil
    var postTime: String
    var numberOfLikes: String?
    var numberOfComments: String?
    var postType: PostType
}

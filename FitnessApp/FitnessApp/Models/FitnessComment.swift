//
//  FitnessComment.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

struct FitnessComment: FitnessCommentProtocol, Hashable {
    var commentId: Int
    var postId: Int
    var userCommentId: Int
    var commentTime: String
    var content: String
}

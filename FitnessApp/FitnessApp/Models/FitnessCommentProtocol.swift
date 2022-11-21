//
//  FitnessCommentProtocol.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

protocol FitnessCommentProtocol {
    var commentId: Int { get }
    var postId: Int { get }
    var userCommentId: Int { get }
    var commentTime: String { get }
    var content: String { get }
}

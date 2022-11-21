//
//  FitnessNotificationPayloadProtocol.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation

enum InteractionType {
    case like(viewer: FitnessUserProtocol)
    case comment(viewer: FitnessUserProtocol, content: String)
    case systemNotification(content: String)
    
    var content: String? {
        switch self {
        case .like:
            return nil
        case .comment(_, let content), .systemNotification(let content):
            return content
        }
    }
    
    var imageIcon: String {
        switch self {
        case .like(let viewer), .comment(let viewer, _):
            return viewer.imageIcon
        case .systemNotification:
            return "fitness-small-icon"
        }
    }
    
    var isCommentType: Bool {
        switch self {
        case .comment:
            return true
        default:
            return false
        }
    }
}

protocol FitnessNotificationPayloadProtocol {
    var notificationId: Int { get }
    var postId: Int { get }
    var readMessage: Bool { get }
    var interactionType: InteractionType { get }
    var actionTime: String { get }
}


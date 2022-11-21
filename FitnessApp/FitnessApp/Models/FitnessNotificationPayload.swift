//
//  FitnessNotificationPayload.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessNotificationPayload: FitnessNotificationPayloadProtocol {
    var notificationId: Int
    var postId: Int
    var readMessage: Bool
    var interactionType: InteractionType
    var actionTime: String
}

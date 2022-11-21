//
//  FitnessMockingData.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import Foundation
import UIKit

class FitnessMockingData {
    
    private init() {}
    static let shared = FitnessMockingData()
    
    let userList = [FitnessUser(userId: 1, userName: "Christian Joseph", imageIcon: "mocking-avatar-icon-1"),
                    FitnessUser(userId: 2, userName: "Tommy Parker", imageIcon: "mocking-avatar-icon-2"),
                    FitnessUser(userId: 3, userName: "Jessica Mendez", imageIcon: "mocking-avatar-icon-3"),
                    FitnessUser(userId: 4, userName: "Samantha Keiko", imageIcon: "mocking-avatar-icon-4"),
                    FitnessUser(userId: 5, userName: "Jenifer Lopez", imageIcon: "mocking-avatar-icon-5")]
    
    let postList = [FitnessPost(postId: 1, userId: 3, content: "Yummy breakfast on weekend", hashtag: "#brekkie", image: "mocking-post-1", postTime: "13 mins ago", numberOfLikes: "45", numberOfComments: "8", postType: .normalPost),
                    FitnessPost(postId: 2, userId: 4, content: "Every day I'm shufflin", image: "mocking-post-2", postTime: "14 mins ago", numberOfLikes: "53", numberOfComments: "6", postType: .event),
                    FitnessPost(postId: 3, userId: 4, content: "Yummy breakfast on weekend", image: "mocking-post-3", postTime: "15 mins ago",  numberOfLikes: "22", numberOfComments: "12", postType: .challenge)]
    
    let commentList = [FitnessComment(commentId: 1,
                                      postId: 1,
                                      userCommentId: 2,
                                      commentTime: "14 mins ago",
                                      content: "Bananas are healthy and nutritious, there is no doubt about that. They are also high in fiber, but low in calories."),
                       FitnessComment(commentId: 2,
                                      postId: 1,
                                      userCommentId: 3,
                                      commentTime: "14 mins ago",
                                      content: "Yes, I think so")]
    
    let nearbyList = [FitnessNearbyEvent(title: "National Health Movement",
                                         eventDescription: "Public Event",
                                         month: "Oct",
                                         day: "13"),
                      FitnessNearbyEvent(title: "Go Red for Women",
                                         eventDescription: "Public Event",
                                         month: "Oct",
                                         day: "12")]
    
    lazy var highlightEvent = FitnessHighlightEvent(title: "Save money for both you and your friends",
                                                    description: "Eat the right amount of food and stay hydrated throught the day",
                                                    image: "mocking-highlight-event",
                                                    attendees: FitnessMockingData.shared.userList)
    
    
    func getUser(from id: Int) -> FitnessUserProtocol {
        return userList.filter { $0.userId == id }.first!
    }
    
    func getPost(from id: Int) -> FitnessPostProtocol {
        return postList.filter { $0.postId == id }.first!
    }
    
    lazy var getNotificationList = [FitnessNotificationPayload(notificationId: 1,
                                                               postId: 1,
                                                               readMessage: false,
                                                               interactionType: InteractionType.like(viewer: FitnessMockingData.shared.getUser(from: 1)),
                                                               actionTime: "3 mins ago"),
                                    FitnessNotificationPayload(notificationId: 2,
                                                               postId: 0,
                                                               readMessage: false,
                                                               interactionType: InteractionType.systemNotification(content: "Congrats you just hit your goal!. Let’s share this with your friend."),
                                                               actionTime: "4 mins ago"),
                                    FitnessNotificationPayload(notificationId: 3,
                                                               postId: 1,
                                                               readMessage: true,
                                                               interactionType: InteractionType.comment(viewer: FitnessMockingData.shared.getUser(from: 2),
                                                                                                        content: "Looking good! Can you share me the smoothie recipe? Want to try"),
                                                               actionTime: "5 mins ago"),
                                    FitnessNotificationPayload(notificationId: 4,
                                                               postId: 3,
                                                               readMessage: true,
                                                               interactionType: InteractionType.like(viewer: FitnessMockingData.shared.getUser(from: 3)),
                                                               actionTime: "6 mins ago"),
                                    FitnessNotificationPayload(notificationId: 5,
                                                               postId: 0,
                                                               readMessage: true,
                                                               interactionType: InteractionType.systemNotification(content: "Howdy! Thanks for joining our community. Feel free to contact us if you need something."),
                                                               actionTime: "7 mins ago")]
    
    let articles = [FitnessArticle(articleId: 1,
                                   title: "20-minutes Outdoor Can Make You Less Stressed",
                                   author: "Jimmy Abrahamson",
                                   image: "fitness-explore-img",
                                   category: .health,
                                   time: "5 min read"),
                    FitnessArticle(articleId: 2,
                                   title: "20-minutes Outdoor Can Make You Less Stressed",
                                   author: "Jimmy Abrahamson",
                                   image: "fitness-explore-img",
                                   category: .health,
                                   time: "5 min read")]
    
    let inspirations = [SubContentModel(id: 1,
                                        title: "7 Nutrition Tips to Lose Weight Faster",
                                        image: "mock-image-content",
                                        category: .nutrition,
                                        numericalOrder: nil),
                        SubContentModel(id: 2,
                                        title: "7 Nutrition Tips to Lose Weight Faster",
                                        image: "mock-image-content",
                                        category: .nutrition,
                                        numericalOrder: nil)]
    
    let sessions = [SubContentModel(id: 1,
                                    title: "Train Whistle At Night",
                                    image: "mock-image-content",
                                    category: .nutrition,
                                    numericalOrder: "1"),
                    SubContentModel(id: 2,
                                    title: "The Twilight Zone",
                                    image: "mock-image-content",
                                    category: .nutrition,
                                    numericalOrder: "2"),
                    SubContentModel(id: 3,
                                    title: "Welcome to Night Vale",
                                    image: "mock-image-content",
                                    category: .nutrition,
                                    numericalOrder: "1"),
                    SubContentModel(id: 4,
                                    title: "The Coronation Lantern",
                                    image: "mock-image-content",
                                    category: .nutrition,
                                    numericalOrder: "2")]
    
    let songs = [FitnessSong(songId: "1",
                             name: "Train Whistle At Night",
                             singer: "Jimmy Abrahamson",
                             category: .health,
                             duration: "10 mins"),
                 FitnessSong(songId: "2",
                             name: "Mindfullness of Breath",
                             singer: "Joseph Fink",
                             category: .nutrition,
                             duration: "5 mins"),
                 FitnessSong(songId: "3",
                             name: "A Meditation Lullaby",
                             singer: "Michel Jackson",
                             category: .meditation,
                             duration: "10 mins"),
                 FitnessSong(songId: "4",
                             name: "The Twilight Zone",
                             singer: "Eminem",
                             category: .health,
                             duration: "10 mins"),
                 FitnessSong(songId: "5",
                             name: "You belong to me",
                             singer: "Taylor Swift",
                             category: .nutrition,
                             duration: "5 mins")
    ]
    
    let mockingReward = [FitnessQuickContent(id: 1,
                                             title: "7 Nutrition Tips to Lose Weight Faster",
                                             subTitle: "100pt",
                                             image: "fitness-browse-image"),
                         FitnessQuickContent(id: 2,
                                             title: "8 Tips to Gain Weight Faster",
                                             subTitle: "120pt",
                                             image: "fitness-explore-img")]
    
    let mockingWellness = [FitnessQuickContent(id: 1,
                                               title: "Living Beyond Fear",
                                               subTitle: "15 minutes",
                                               image: "mock-image-content"),
                           FitnessQuickContent(id: 2,
                                               title: "Retrain Your Brain",
                                               subTitle: "10 minutes",
                                               image: "mock-image-content"),
                           FitnessQuickContent(id: 3,
                                               title: "Living Beyond Fear",
                                               subTitle: "20 minutes",
                                               image: "mock-image-content"),
                           FitnessQuickContent(id: 4,
                                               title: "Retrain Your Brain",
                                               subTitle: "40 minutes",
                                               image: "mock-image-content")]
    
    let mockingMeditation = [FitnessQuickContent(id: 1,
                                                 title: "Mindfullness of Breath",
                                                 subTitle: "15 minutes",
                                                 image: "mock-image-content"),
                             FitnessQuickContent(id: 2,
                                                 title: "A Meditation Lullaby",
                                                 subTitle: "10 minutes",
                                                 image: "mock-image-content"),
                             FitnessQuickContent(id: 3,
                                                 title: "Mindfullness of Breath",
                                                 subTitle: "20 minutes",
                                                 image: "mock-image-content"),
                             FitnessQuickContent(id: 4,
                                                 title: "8 Tips to Gain Weight Faster",
                                                 subTitle: "40 minutes",
                                                 image: "mock-image-content")]
    
    let journal = [("Today", "50.5"), ("Wednesday", "50"), ("Thursday", "51")]
    var insightWater: [(date: String, water: CGFloat)] = [(date: "M", water: 30.0),
                                                          (date: "T", water: 100.0),
                                                          (date: "W", water: 100.0),
                                                          (date: "T", water: 40.0),
                                                          (date: "F", water: 0.0),
                                                          (date: "S", water: 80.0),
                                                          (date: "S", water: 10.0)]
    
    let trackingData = [FitnessTrackingProgress(title: "Nutrition",
                                                value: "1,200 cal",
                                                image: "fitness-nutrition-tutorial-image",
                                                trackingInformationType: .nutrition),
                        FitnessTrackingProgress(title: "Steps",
                                                value: "10,000 steps",
                                                image: "fitness-information-steps",
                                                trackingInformationType: .steps),
                        FitnessTrackingProgress(title: "Water",
                                                value: "8 glasses",
                                                image: "fitness-water-image",
                                                trackingInformationType: .water),
                        FitnessTrackingProgress(title: "Weight",
                                                value: "50 kg",
                                                image: "fitness-weight-image",
                                                trackingInformationType: .weight)]
    
    let badgesData = [("fitness-badge-image", "High Achiever"),
                       ("fitness-badge-image-3", "Moon Walker")]
    
    var trackingTarget = [FitnessTrackingProgress(title: "Nutrition",
                                                  value: "300 cal / 1200 cal",
                                                  image: "fitness-nutrition-tutorial-image",
                                                  isWarning: false,
                                                  trackingInformationType: .nutrition),
                          FitnessTrackingProgress(title: "Water",
                                                  value: "3 / 8 glasses",
                                                  image: "fitness-water-image",
                                                  isWarning: true,
                                                  trackingInformationType: .water),
                          FitnessTrackingProgress(title: "Daily Steps",
                                                  value: "7,637 / 12,000 steps",
                                                  image: "fitness-information-steps",
                                                  isWarning: false,
                                                  trackingInformationType: .steps)]
    
    let steps = [FitnessTrackingProgress(title: "Nutrition",
                                         value: "300 cal / 1200 cal",
                                         image: "fitness-nutrition-tutorial-image",
                                         isWarning: false),
                 FitnessTrackingProgress(title: "Water",
                                         value: "3 / 8 glasses",
                                         image: "fitness-water-image",
                                         isWarning: true)]
    
    let nutritionIngredients = [FitnessTrackingProgress(title: "Carb",
                                                        value: "100 g",
                                                        image: "32%",
                                                        isWarning: false),
                                FitnessTrackingProgress(title: "Canxi",
                                                        value: "90 g",
                                                        image: "40%",
                                                        isWarning: true),
                                FitnessTrackingProgress(title: "Fat ",
                                                        value: "100 g",
                                                        image: "20%",
                                                        isWarning: false)]
}


//
//  FitnessAppConfiguration.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import UIKit

class FitnessAppConfiguration: FitnessAppConfigurationProtocol {
    
    // MARK: - App configuration part
    private init() {}
    static let shared = FitnessAppConfiguration()
    var shadowColor = UIColor(hexString: "#DCE6E6")
    var walkthroughData = [
        ATCCarouselModel(id: 0, image: "interaction1", title: "Welcome to Lookupp", description: "Focus on people not screens!"),
        ATCCarouselModel(id: 1, image: "fitness-onboarding2-icon", title: "Generate people time get rewards! ", description: "lock your phonesfor meaningful people connections."),
        ATCCarouselModel(id: 2, image: "fitness-onboarding3-icon", title: "Productivity, relationships,and mental health", description: "You can do this!")
    ]
    
    var interests: [Interest] = [
        Interest(id: 0, title: "Fashion", image: "fitness-fashion-icon"),
        Interest(id: 0, title: "Organic", image: "fitness-organic-icon"),
        Interest(id: 0, title: "Meditation", image: "fitness-meditation-icon"),
        Interest(id: 0, title: "Fitness", image: "fitness-sketch-icon"),
        Interest(id: 0, title: "Smoke Free", image: "fitness-smokefree-icon"),
        Interest(id: 0, title: "Sleep", image: "fitness-sleep-icon"),
        Interest(id: 0, title: "Health", image: "fitness-health-icon"),
        Interest(id: 0, title: "Running", image: "fitness-running-icon"),
        Interest(id: 0, title: "Vegan", image: "fitness-vegan-icon")
    ]
    
    // MARK: - UI config part
    let mainThemeBackgroundColor: UIColor = UIColor(hexString: "#f4f6fa")
    let mainThemeForegroundColor: UIColor = UIColor(hexString: "#7265e3")
    let mainTextColor: UIColor = UIColor(hexString: "#464646")
    let mainSubtextColor: UIColor = UIColor(hexString: "#e5e5ea")
    let statusBarStyle: UIStatusBarStyle = .default
    let hairlineColor: UIColor = UIColor(hexString: "#e1ddf5")
    var colorGray0: UIColor = .black
    var colorGray3: UIColor = .gray
    var colorGray9: UIColor = UIColor(hexString: "#8e8e93")

    let regularSmallFont = UIFont(name: "Rubik-Regular", size: 14)!
    let regularMediumFont = UIFont(name: "Rubik-Regular", size: 16)!
    let regularLargeFont = UIFont(name: "Rubik-Regular", size: 18)!
    let mediumBoldFont = UIFont(name: "Rubik-Medium", size: 16)!
    let boldLargeFont = UIFont(name: "Rubik-Medium", size: 18)!
    let boldSmallFont = UIFont(name: "Rubik-Medium", size: 12)!
    let boldSuperSmallFont = UIFont(name: "Rubik-Bold", size: 10)!
    let boldSuperLargeFont = UIFont(name: "Rubik-Medium", size: 24)!
    let italicMediumFont = UIFont(name: "Rubik-MediumItalic", size: 14)!

    func regularFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-Regular", size: size)!
    }

    func boldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-Bold", size: size)!
    }

    func lightFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Rubik-Light", size: size)!
    }
    
    func configureUI() {}
    
    // MARK: - Subscription part
    var firstSubscription = ATCSubscription(name: "4.99$/month",
                                                  startDate: Date(),
                                                  endDate: Calendar.current.date(byAdding: .month, value: 1, to: Date()),
                                                  type: .autoRenewableSubscription)
    var secondSubscription = ATCSubscription(name: "89.99$/year",
                                                   startDate: Date(),
                                                   endDate: Calendar.current.date(byAdding: .year, value: 1, to: Date()),
                                                   type: .autoRenewableSubscriptionByYear)
    
    var freeTrialSubscription = ATCSubscription(name: "Free Trial",
                                                startDate: Date(),
                                                endDate: Calendar.current.date(byAdding: .day, value: 7, to: Date()),
                                                type: .freeTrialAutoRenewableSubscription)
    
    var carouselData = [
        ATCCarouselModel(id: 0, image: "dating-onboarding1-icon", title: "Go premium, unlimited access", description: "When you subscribe, you get instant unlimited access to all resources."),
        ATCCarouselModel(id: 1, image: "dating-onboarding2-icon", title: "Get a Personal Trainer", description: "Our premium package includes a weekly 1-hour session with a personal trainer."),
        ATCCarouselModel(id: 2, image: "dating-onboarding3-icon", title: "VIP Guest Membership", description: "As a valued member, you can place your friends, family on your VIP guest list to work together."),
        ATCCarouselModel(id: 3, image: "dating-onboarding4-icon", title: "Professional Gymnastics", description: "Come along with it, you get instant unlimited access to Professional Gymnastics courses."),
        ATCCarouselModel(id: 4, image: "dating-onboarding5-icon", title: "VIP Environment", description: "You only need to workout as passionately as you work. Let us take care the rest.")
    ]
    
    var settings = [SettingModel(text: "Edit Profile"),
                    SettingModel(text: "Invite Friend"),
                    SettingModel(text: "Push Notification", isToggleShown: true),
                    SettingModel(text: "Subscribe email", isToggleShown: true),
                    SettingModel(text: "Give Feedback"),
                    SettingModel(text: "Set Weight Reminder"),
                    SettingModel(text: "Set Sleep Reminder"),
                    SettingModel(text: "Notification"),
                    SettingModel(text: "About Us"),
                    SettingModel(text: "Log Out", useThemeColor: true)
    ]
    
    var drawerMenuItems = [(icon: "arkit", text: "Explore "),
                          (icon: "heart", text: "Reward "),
                          (icon: "icloud.and.arrow.up", text: "Share your playlist "),
                          (icon: "person.3", text: "Share your achieved result "),
                          (icon: "arrow.uturn.left", text: "Sign Out ")]
}

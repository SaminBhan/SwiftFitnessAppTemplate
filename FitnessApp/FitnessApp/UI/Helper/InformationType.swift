//
//  InformationType.swift
//  FitnessApp
//
//  Created by Duy Bui on 1/11/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import SwiftUI

enum InformationType {
    case phoneNumber
    case email
    case password
    
    var title: String {
        switch self {
        case .phoneNumber:
            return "Let’s start with your mobile number"
        case .email:
            return "What is your email address?"
        case .password:
            return "Now let’s set your password"
        }
    }
    
    var placeHolderText: String {
        switch self {
        case .phoneNumber:
            return "Enter your mobile number"
        case .email:
            return "Enter your email address?"
        case .password:
            return "Enter your password"
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .phoneNumber:
            return .numberPad
        default:
            return .default
        }
    }
    
    var textAlignment: TextAlignment {
        switch self {
        case .phoneNumber:
            return .leading
        default:
            return .center
        }
    }
    
    var nextDestination: AnyView {
        switch self {
        case .phoneNumber:
            return AnyView(FitnessVerificationCodeView())
        case .email:
            return AnyView(FitnessInformationView(informationType: .password))
        case .password:
            return AnyView(FitnessFingerPrintView())
        }
    }
}

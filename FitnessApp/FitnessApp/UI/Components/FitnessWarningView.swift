//
//  FitnessWarningView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessWarningView: View, AppConfigProtocol {
    private let originalString: String
    private let highlightString: String
    private let fontSize: UIFont
    private let fontColor: UIColor
    private let backgroundColor: UIColor
    init(originalString: String,
         highlightString: String,
         fontSize: UIFont = UIFont(name: "Rubik-Medium", size: 16)!,
         fontColor: UIColor = UIColor(hexString: "#f77777"),
         backgroundColor: UIColor = UIColor(hexString: "#f4dcdc")) {
        self.originalString = originalString
        self.highlightString = highlightString
        self.fontSize = fontSize
        self.fontColor = fontColor
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        HStack {
            Text(originalString)
                .font(.custom(fontSize.familyName,
                              size: fontSize.pointSize))
                .foregroundColor(Color(fontColor))
                + Text(highlightString)
                    .font(.custom(fontSize.familyName,
                                  size: fontSize.pointSize))
                    .foregroundColor(Color(UIColor(hexString: "#f77777")))
                    .underline()
            Spacer()
            Image("cross-filled-icon")
                .resizable()
                .frame(width: 16, height: 16)
        }.padding()
            .background(Color(backgroundColor))
    }
}


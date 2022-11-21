//
//  SingleVerificationCodeView.swift
//  FitnessApp
//
//  Created by Duy Bui on 1/8/20.
//  Copyright © 2020 Duy Bui. All rights reserved.
//

import SwiftUI

struct SingleVerificationCodeView: View, AppConfigProtocol {
    @State var textFieldString: String = "8"
    var body: some View {
        TextField("", text: $textFieldString) {
            self.endEditing(true)
        }
        .disabled(textFieldString.count > 0)
        .keyboardType(.numberPad)
        .multilineTextAlignment(.center)
        .modifier(ATCTextModifier(font: appConfig.boldLargeFont,
                                  color: .black))
        .frame(width: 62, height: 62, alignment: .center)
        .background(Color.white)
        .cornerRadius(22.5)
        .modifier(ATCShadowModifier(color: appConfig.shadowColor))
    }
}

//
//  FitnessCreatePostView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI
import Combine

struct FitnessCreatePostView: View, AppConfigProtocol {
    @State var content: String = ""
    @Binding var showSheetView: Bool
    @ObservedObject private var keyboard = KeyboardResponder()
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Create Post")
                    .modifier(ATCTextModifier(font: appConfig.boldFont(size: 24),
                                              color: .black))
                
                HStack {
                    Image("mocking-avatar-icon-6")
                    TextField("Share your thought...", text: $content)
                        .font(.custom(appConfig.regularMediumFont.fontName,
                                      size: appConfig.regularMediumFont.pointSize))
                        .foregroundColor(Color(appConfig.hairlineColor))
                        .padding()
                }
            }.padding()
            Spacer()
            FitnessButtonsOnPostView(showSheetView: $showSheetView)
        }.padding(.bottom, keyboard.currentHeight)
            .edgesIgnoringSafeArea(keyboard.currentHeight == 0.0 ? .leading: .bottom)
    }
}

struct FitnessButtonsOnPostView: View, AppConfigProtocol {
    @ObservedObject private var keyboard = KeyboardResponder()
    @Binding var showSheetView: Bool
    @State var showCaptureImageView: Bool = false
    @State var image: Image? = nil
    @State var expand: Bool = false
    @State var textFieldString: String = ""
    var body: some View {
        VStack {
            ATCSeparatorHorizontalLineView()
            HStack(spacing: 30) {
                // Camera icon
                Button(action: {
                    self.showCaptureImageView.toggle()
                }) {
                    Image("fitness-camera-icon")
                }
                // Sticker icon
                Button(action: {
                    print("Got here")
                }) {
                    Image("fitness-smile-icon")
                }
                // Poll icon
                Button(action: {
                    print("Got here")
                }) {
                    Image("fitness-poll-icon")
                }
                Spacer()
                Button(action: {
                   self.showSheetView.toggle()
                }) {
                    Text("Post")
                        .modifier(ATCButtonModifier(font: appConfig.mediumBoldFont,
                                                    color: appConfig.mainThemeForegroundColor,
                                                    width: 90,
                                                    height: 35))
                }
            }.padding()
            if (showCaptureImageView) {
                CameraAndGalleryView(isShown: $showCaptureImageView, image: $image)
            }
        }
    }
}

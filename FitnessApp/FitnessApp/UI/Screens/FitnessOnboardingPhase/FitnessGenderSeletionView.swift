//
//  FitnessGenderSeletionView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI
struct FitnessGenderView: View {
    @Binding var isSelected: Bool
    let isMale: Bool
    let completionHandler: () -> ()
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Image(isSelected ? "fitness-selected-icon" : "dating-empty-circle-icon")
                    .padding([.top, .trailing], 17)
            }
            Spacer()
            VStack(alignment: .center, spacing: 17) {
                Image(isMale ? "fitness-male-gender-icon" : "fitness-female-gender-icon")
                Text(isMale ? "Male" : "Female")
            }
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(10.0)
        .frame(width: 146, height: 176)
        .onTapGesture {
            self.isSelected.toggle()
            self.completionHandler()
        }
    }
}

struct FitnessGenderSeletionView: View, AppConfigProtocol {
    @State var isMaleSelected: Bool = true
    @State var isFemaleSubSelected: Bool = false
    @State var pushActive = false
    
    var body: some View {
        VStack {
            NavigationLink(destination: FitnessOnboardingNotificationView(),
                           isActive: self.$pushActive) {
                            EmptyView()
            }.hidden()
            .navigationBarTitle("")
            BaseView(title: "Which one are you?",
                     buttonName: "Continue",
                     actionButton: { self.pushActive = true }) {
                        VStack(alignment: .center, spacing: 32) {
                            HStack(alignment: .center, spacing: 19) {
                                FitnessGenderView(isSelected: $isMaleSelected, isMale: true) {
                                    if self.isMaleSelected {
                                        self.isFemaleSubSelected = false
                                        // To-do: save and handle selected gender here
                                    }
                                }
                                FitnessGenderView(isSelected: $isFemaleSubSelected, isMale: false) {
                                    if self.isFemaleSubSelected {
                                        self.isMaleSelected = false
                                        // To-do: save and handle selected gender here
                                    }
                                }
                            }
                            ATCTitleDescriptionView(title: nil,
                                                    description: "To give you a better experience we need to know your gender",
                                                    appConfig: appConfig)
                                .padding([.leading, .trailing], 55)
                        }.padding(.top, 15)
            }
        }
    }
}


//
//  FitnessEventChallengeView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessEventChallengeView: View, AppConfigProtocol {
    let highlightEventProtocol: FitnessHighlightEventProtocol
    
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            ATCCustomNavigationBarView(title: "Challenge",
                                       leftIcon: "fitness-back-icon",
                                       leftButtonAction: {
                                        self.mode.wrappedValue.dismiss()
            })
            ScrollView {
                BaseView(buttonName: "Accept Challenge",
                         footerButtonName: "Skip",
                         isLogoShown: false) {
                            VStack {
                                Image("mocking-post-2")
                                    .resizable()
                                    .frame(height: 210, alignment: .center)
                                VStack {
                                    FitnessEventCalenderCellView(nearbyEvent: FitnessMockingData.shared.nearbyList[0])
                                    ATCSeparatorHorizontalLineView()
                                        .padding()
                                    Text("Get active on your off days and challenge your friends by taking the most steps on Saturday and Sunday!")
                                        .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                                  color: .black))
                                    FitnessAttendeesView(attendees: highlightEventProtocol.attendees)
                                }.padding()
                            }
                            .cornerRadius(15)
                            .padding()
                }
            }
        }.padding(.top, 20)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

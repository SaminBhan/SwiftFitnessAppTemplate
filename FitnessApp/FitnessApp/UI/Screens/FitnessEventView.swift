//
//  FitnessEventView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessEventView: View, AppConfigProtocol {
    let highlightEventProtocol: FitnessHighlightEventProtocol
    
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            ATCCustomNavigationBarView(title: "Event",
                                       leftIcon: "fitness-back-icon",
                                       leftButtonAction: {
                                        self.mode.wrappedValue.dismiss()
            })
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    Image(highlightEventProtocol.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(highlightEventProtocol.title)
                            .multilineTextAlignment(.leading)
                            .modifier(ATCTextModifier(font: appConfig.boldFont(size: 20),
                                                      color: .black))
                        Text(highlightEventProtocol.description)
                            .multilineTextAlignment(.leading)
                            .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                      color: appConfig.colorGray9))
                    }
                    FitnessAttendeesView(attendees: highlightEventProtocol.attendees).padding(20)
                    Rectangle().fill(Color(appConfig.mainThemeBackgroundColor)).frame(height: 13)
                    VStack(spacing: 25) {
                        FitnessTitleContainerView(title: "Nearby Events",
                                                  font: appConfig.regularFont(size: 20))
                        VStack(spacing: 20) {
                            FitnessEventCalenderCellView(nearbyEvent: FitnessMockingData.shared.nearbyList[0])
                            FitnessEventCalenderCellView(nearbyEvent: FitnessMockingData.shared.nearbyList[1])
                        }
                    }.padding(20)
                }
            }
        }.padding(.top, 20)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

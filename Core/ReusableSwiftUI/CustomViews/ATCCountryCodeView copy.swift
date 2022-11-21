//
//  ATCCountryCodeView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

fileprivate struct Country {
    var id: String
    var name: String
}

// Function to put United States at the top of the list

fileprivate func getLocales() -> [Country] {
    let locales = Locale.isoRegionCodes
        .filter { $0 != "United States"}
        .compactMap { Country(id: $0, name: Locale.current.localizedString(forRegionCode: $0) ?? $0)}
    return [Country(id: "US", name: Locale.current.localizedString(forRegionCode: "US") ?? "United States")] + locales
}
struct ATCCountryCodeView: View, AppConfigProtocol {
    @State var expand: Bool = false
    
    var body: some View {
        HStack(alignment: .center, spacing: 13) {
            VStack {
                HStack(alignment: .center, spacing: 13) {
                    Image("USA")
                        .frame(width: 30, height: 21)
                    Text("+01")
                        .modifier(ATCTextModifier(font: appConfig.regularMediumFont,
                                                  color: .black))
                }
                if expand {
                    // To-do: Implement drop down list here
                }
            }
            Image("fitness-dropdown-icon")
                .frame(width: 24, height: 24)
                .onTapGesture {
                    self.expand.toggle()
                    print(self.expand)
            }
        }
    }
}

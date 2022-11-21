//
//  FitnessFeedView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

enum FeedEnum {
    case system
    case content
    case survey
}

struct FitnessFeedView: View, AppConfigProtocol, ATCDrawerMenuItemProtocol {
    @State private var indexDrawerItem = 1
    @State private var pushActive = false
    @State private var openDrawer = false
    @State private var selectedPost: FitnessPostProtocol?
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: getDestinationWithContainerView(),
                               isActive: self.$pushActive) {
                                EmptyView()
                }
                .navigationBarTitle(Text(""), displayMode: .inline)
                .navigationBarHidden(true)
                .hidden()
                FitnessDrawerBaseView(user: FitnessMockingData.shared.userList[0],
                                      openDrawer: $openDrawer, completion: { result in
                                                              self.indexDrawerItem = result
                                                              self.pushActive = true
                                      }) {
                                        VStack {
                                            ATCCustomNavigationBarView(title: "Community",
                                                                       rightIcon: .avatar(user: FitnessMockingData.shared.userList[0]),
                                                                       leftButtonAction: { self.openDrawer.toggle() })
                                            ScrollView {
                                                VStack(alignment: .leading, spacing: 26) {
                                                    ScrollView(.horizontal, content: {
                                                        HStack(spacing: 15) {
                                                            ForEach(FitnessMockingData.shared.userList, id: \.userId) { user in
                                                                VStack {
                                                                    ATCAvatarView(image: user.imageIcon,
                                                                                  squareLength: 65,
                                                                                  needBorder: true)
                                                                }
                                                            }.padding(.vertical, 5)
                                                        }.padding(.top, 20)
                                                    })
                                                    VStack {
                                                        ForEach(FitnessMockingData.shared.postList, id: \.postId) { setting in
                                                            ATCFeedFullInfoView(post: setting).onTapGesture {
                                                                self.selectedPost = setting
                                                                self.indexDrawerItem = 6
                                                                self.pushActive = true
                                                            }
                                                        }
                                                    }
                                                }.padding(.horizontal, 20)
                                            }
                                        }.padding(.top, 20)
                                            .background(Color(appConfig.mainThemeBackgroundColor))
                                            .edgesIgnoringSafeArea(.all)
                }
            }
        }
    }
    
    func getDestinationWithContainerView() -> AnyView? {
        if indexDrawerItem == 6 {
            switch selectedPost!.postType {
            case .event:
                return AnyView(FitnessEventView(highlightEventProtocol: FitnessMockingData.shared.highlightEvent))
            case .challenge:
                return AnyView(FitnessEventChallengeView(highlightEventProtocol: FitnessMockingData.shared.highlightEvent))
            case .normalPost:
                return AnyView(FitnessPostDetailView(post: FitnessMockingData.shared.postList[0], comments: FitnessMockingData.shared.commentList))
            }
        } else {
            return AnyView(getDestinationFromDrawerView(with: indexDrawerItem))
        }
    }
}

struct FitnessFeedView_Previews: PreviewProvider {
    static var previews: some View {
        FitnessFeedView()
    }
}

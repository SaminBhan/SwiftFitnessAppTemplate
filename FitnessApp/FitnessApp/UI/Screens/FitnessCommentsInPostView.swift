//
//  FitnessCommentsInPostView.swift
//  FitnessApp
//
//  Copyright © 2020 iOSAppTemplates. All rights reserved.
//

import SwiftUI

struct FitnessPostDetailView: View, AppConfigProtocol {
    @State private var comment = ""
    private let post: FitnessPostProtocol
    private let comments: [FitnessCommentProtocol]
    
    /// Pop programatically
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    init(post: FitnessPostProtocol, comments: [FitnessCommentProtocol]) {
        self.post = post
        self.comments = comments
        UITableView.appearance().tableFooterView = UIView()
    }
    
    var body: some View {
        VStack {
            ATCCustomNavigationBarView(leftIcon: "fitness-back-icon",
                                       leftButtonAction: {
                                        self.mode.wrappedValue.dismiss()
            })
            ScrollView {
                VStack {
                    ATCFeedFullInfoView(post: FitnessMockingData.shared.postList[0]).padding()
                    ATCCommentsView(title: "Comments", comments: comments)
                    Spacer()
                    ATCSeparatorHorizontalLineView()
                    TextField("Write comment..", text: $comment)
                        .padding(.leading)
                }
            }
        }.padding(.top, 20)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarHidden(true)
    }
}

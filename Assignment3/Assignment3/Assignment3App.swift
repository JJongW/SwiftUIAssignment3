//
//  Assignment3App.swift
//  Assignment3
//
//  Created by 신종원 on 12/10/23.
//

import SwiftUI

@main
struct Assignment3App: App {
    var articleModel = ArticleViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleModel)
                .onAppear {
                    articleModel.fetch()
                }
        }
    }
}

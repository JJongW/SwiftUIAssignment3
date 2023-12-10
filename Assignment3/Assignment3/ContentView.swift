//
//  ContentView.swift
//  Assignment3
//
//  Created by 신종원 on 12/10/23.
//

import SwiftUI
import YDS_SwiftUI

struct ContentView: View {
    @EnvironmentObject var articleModel: ArticleViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(articleModel.article) { article in
                Text("\(article.title!)")
                    .font(YDSFont.subtitle1)
                HStack {
                    YDSBadge(text: article.tagList?[0], icon: YDSIcon.clipLine, color: YDSColor.emeraldItemBG)
                    YDSBadge(text: article.tagList?[1], icon: YDSIcon.clipLine, color: YDSColor.emeraldItemBG)
                    YDSBadge(text: article.tagList?[2], icon: YDSIcon.clipLine, color: YDSColor.emeraldItemBG)
                    YDSBadge(text: article.tagList?[3], icon: YDSIcon.clipLine, color: YDSColor.emeraldItemBG)
                }
                Text(article.body ?? "")
                    .font(YDSFont.body1)
                Spacer()
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: article.author?.image ?? "")) {image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 48, height: 48).cornerRadius(16)
                    Spacer()
                    Text("\(article.author?.username ?? "")")
                        .font(YDSFont.body1)
                    Spacer()
                    if article.author?.following == false {
                        YDSIcon.starLine
                            .resizable()
                            .frame(width: 48, height: 48)
                    } else {
                        YDSIcon.starFilled
                            .resizable()
                            .frame(width: 48, height: 48)
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
        .onAppear{
            articleModel.fetch()
        }
    }
}

//#Preview {
//    ContentView(articleModel.articles)
//}

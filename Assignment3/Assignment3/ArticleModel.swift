//
//  Articles.swift
//  Assignment3
//
//  Created by 신종원 on 12/10/23.
//

import Foundation

struct Articles: Codable {
    let articles: [ArticleModel]
    let articlesCount: Int?
}

struct ArticleModel: Identifiable, Codable {
    let id: Int?
    let slug, title, description, body: String?
    let createdAt, updatedAt: String?
    let tagList: [String]?
    let favorited: Bool?
    let favoritesCount: Int?
    let author: Author?
    
    enum CodingKeys: String, CodingKey {
        case id, slug, title, description, body, createdAt, updatedAt, tagList, favorited, favoritesCount, author
    }
}

struct Author: Codable {
    let id: Int?
    let username, image: String?
    let bio: String?
    let following: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, username, image, bio, following
    }
}

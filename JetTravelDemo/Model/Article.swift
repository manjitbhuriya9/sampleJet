//
//  Article.swift
//  JetTravelDemo
//
//  Created by Organization on 04/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let createdAt: String?
    let content: String?
    let comments: Double?
    let likes: Double?
    let user: [User]?
    let media: [Media]?
}

struct User: Codable {
    let name: String?
    let lastname : String?
    let designation: String?
    let avatar: String?
}

struct Media: Codable {
    let image: String?
    let title: String?
    let url: String?
    
}

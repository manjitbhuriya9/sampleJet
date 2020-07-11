//
//  ArticleViewModel.swift
//  JetTravelDemo
//
//  Created by Organization on 04/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import Foundation


struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
    
    var content: String {
        if let content = self.article.content{
            return content
        }else {
            return ""
        }
    }
    
    var createdAt: String {
        if let createdAt = self.article.createdAt {
            return createdAt
        }else {
            return ""
        }
    }
    
    var comments: String {
        if let comments = self.article.comments {
            return comments.roundedWithAbbreviations
        }else{
            return ""
        }
    }
    
    var likes: String {
        if let likes = self.article.likes {
            return likes.roundedWithAbbreviations
        }else{
            return ""
        }
    }
    
    var title: String {
        if let title = self.article.media?[0].title {
            return title
        }else {
            return ""
        }
    }
    
    var url: String {
        if let url = self.article.media?[0].url {
            return url
        }else {
            return ""
        }
    }
    
    var image: String {
        if let image = self.article.media?[0].image {
            return image
        }else {
            return ""
        }
    }
    
    var name: String {
        if let name = self.article.user?[0].name {
            return name + " " + lastname
        }else {
            return ""
        }
    }
    
    var lastname: String {
        if let lastname = self.article.user?[0].lastname {
            return lastname
        }else {
            return ""
        }
    }
    
    var designation: String {
        if let designation = self.article.user?[0].designation {
            return designation
        }else {
            return ""
        }
    }
    
    var avatar: String {
        if let avatar = self.article.user?[0].avatar {
            return avatar
        }else {
            return ""
        }
    }
    
}

extension Double {
    var roundedWithAbbreviations: String {
        let number = Double(self)
        let thousand = number / 1000
        let million = number / 1000000
        if million >= 1.0 {
            return String(format: "%.1fM", (million*10/10))
        }
        else if thousand >= 1.0 {
            return String(format: "%.1fK", (thousand*10/10))
        }
        else {
            return "\(self)"
        }
    }
}

protocol ArticleListViewModelDelegate: NSObject {
    func parseArticlSuccess()
    func parseArticleFailedWithMessage(_ message: String)
}

class  ArticleListViewModel {
    
    private var article: [Article] {
        didSet {
            self.delegate?.parseArticlSuccess()
        }
    }
    weak var delegate: ArticleListViewModelDelegate?
    //var articles : [Article]
    var pageNumber = 1
    
    init(_ delegate: ArticleListViewModelDelegate?) {
           self.delegate = delegate
           self.article = [Article]()
       }
    
    func getArticleListFromServer() {
        let url = URL(string: Constant().apiDomain + "blogs?page=\(pageNumber)&limit=10")!
        WebServices().getArticlesList(url: url) { (articles) in
            if let articles = articles {
                self.article.append(contentsOf: articles)
                /*for (_, article) in articles.enumerated() {
                    var dictArticles = [String:Any]()
                    dictArticles["createdAt"] = article.createdAt
                    dictArticles["content"] = article.content
                    dictArticles["comments"] = article.comments
                    dictArticles["likes"] = article.likes
                    dictArticles["name"] = article.user?[0].name
                    dictArticles["lastname"] = article.user?[0].lastname
                    dictArticles["designation"] = article.user?[0].designation
                    dictArticles["avatar"] = article.user?[0].avatar
                    dictArticles["image"] = article.media?[0].image
                    dictArticles["title"] = article.media?[0].title
                    dictArticles["url"] = article.media?[0].url
                    DispatchQueue.main.async {
                        DBManager.shardInstance.saveData(object: dictArticles)
                    }
                }*/
            }
        }
    }
    
    func getArticleListFromLocal() {
       let articles = DBManager.shardInstance.getArticleList()
        print(articles)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.article.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.article[index]
        return ArticleViewModel(article)
    }
}

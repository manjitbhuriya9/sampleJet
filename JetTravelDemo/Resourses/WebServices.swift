//
//  WebServices.swift
//  JetTravelDemo
//
//  Created by Organization on 04/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import Foundation

class WebServices {
 
    func getArticlesList(url: URL, completion: @escaping([Article]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion([])
            } else if let data = data {
                do {
                    let articles = try JSONDecoder().decode([Article].self, from: data)
                    if articles.count > 0 {
//                        var dictArticles = [String:Any]()
//                        for (_, article) in articles.enumerated() {
//                            dictArticles["createdAt"] = article.createdAt
//                            dictArticles["content"] = article.content
//                            dictArticles["comments"] = article.comments
//                            dictArticles["likes"] = article.likes
//                            dictArticles["name"] = article.user?[0].name
//                            dictArticles["lastname"] = article.user?[0].lastname
//                            dictArticles["designation"] = article.user?[0].designation
//                            dictArticles["avatar"] = article.user?[0].avatar
//                            dictArticles["image"] = article.media?[0].image
//                            dictArticles["title"] = article.media?[0].title
//                            dictArticles["url"] = article.media?[0].url
//                        }
//                        DispatchQueue.main.async {
//                            DBManager.shardInstance.saveData(object: dictArticles)
//                        }
                        completion(articles)
                    }else{
                        completion([])
                    }
                    
                }catch {
                    completion([])
                }
            }
        }.resume()
    }
    
    func getUserList(url: URL, completion: @escaping([Article]?) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion([])
            } else if let data = data {
                do {
                    let articles = try JSONDecoder().decode([Article].self, from: data)
                    print(articles)
                    completion(articles)
                }catch {
                    completion([])
                }
            }
        }.resume()
    }
}

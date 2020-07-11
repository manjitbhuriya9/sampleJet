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
                        DispatchQueue.main.async {
                            DBManager.shardInstance.saveData(object: data)
                        }
                        completion(articles)
                    }else{
                        completion([])
                    }
                    
                }catch let error {
                    print("decoding error: \(error)")
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

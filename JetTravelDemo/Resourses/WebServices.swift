//
//  WebServices.swift
//  JetTravelDemo
//
//  Created by Abhishek Gupta on 04/07/20.
//  Copyright © 2020 Abhishek Gupta. All rights reserved.
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
                    print(articles)
                    completion(articles)
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

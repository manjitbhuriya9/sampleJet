//
//  DBManager.swift
//  JetTravelDemo
//
//  Created by Organization on 05/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DBManager {
    static var shardInstance = DBManager()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    private init() {}
    
    func saveData(object: Data) {
        let jsonData = NSEntityDescription.insertNewObject(forEntityName: "Articles", into: context!) as! Articles
              
        jsonData.jsonresponse = object
               do {
                   try context?.save()
               }catch {
                   print("Failed to save data into Core Data")
               }
        /*let articles = NSEntityDescription.insertNewObject(forEntityName: "Articles", into: context!) as! Articles
        articles.createdAt = object["createdAt"] as? String
        articles.content = object["content"] as? String
        articles.comments = object["comments"] as? Double ?? 0
        articles.likes = object["likes"] as? Double ?? 0
        articles.name = object["name"] as? String
        articles.lastname = object["lastname"] as? String
        articles.designation = object["designation"] as? String
        articles.avatar = object["avatar"] as? String
        articles.image = object["image"] as? String
        articles.title = object["title"] as? String
        articles.url = object["url"] as? String
        
        do {
            try context?.save()
        }catch {
            print("Failed to save data into Core Data")
        }*/
    }
    
    func getArticleList() -> [Articles]{
        var articles = [Articles]()
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Articles")
        do{
            articles = try context?.fetch(fetchRequest) as! [Articles]
        }catch{
            print("Didn't Get the data")
        }
        
        return articles
    }
    
    func getUserList() {
        
    }
    
    func checkRecordExists(entity: String,uniqueIdentity: String,idAttributeName:String) -> Bool {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entity)
        fetchRequest.predicate = NSPredicate(format: "\(idAttributeName) CONTAINS[cd]")

        var results: [Articles] = []

        do {
            results = try context?.fetch(fetchRequest) as! [Articles]
        }
        catch {
            print("error executing fetch request: \(error)")
        }

        return results.count > 0

    }
    
}

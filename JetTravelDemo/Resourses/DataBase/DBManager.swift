//
//  DBManager.swift
//  JetTravelDemo
//
//  Created by Abhishek Gupta on 05/07/20.
//  Copyright © 2020 Abhishek Gupta. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DBManager {
    static var shardInstance = DBManager()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    private init() {}
    
    func saveData() {
        
    }
    
    func getArticleList() {
        
    }
    
    func getUserList() {
        
    }
    
}

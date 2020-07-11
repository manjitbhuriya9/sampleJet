//
//  Person+CoreDataProperties.swift
//  JetTravelDemo
//
//  Created by Abhishek Gupta on 09/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var jsonresponse: Data?

}

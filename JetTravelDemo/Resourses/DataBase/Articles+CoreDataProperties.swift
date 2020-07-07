//
//  Articles+CoreDataProperties.swift
//  JetTravelDemo
//
//  Created by Organization on 05/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//
//

import Foundation
import CoreData


extension Articles {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Articles> {
        return NSFetchRequest<Articles>(entityName: "Articles")
    }

    @NSManaged public var createdAt: String?
    @NSManaged public var content: String?
    @NSManaged public var comments: Double
    @NSManaged public var likes: Double
    @NSManaged public var name: String?
    @NSManaged public var lastname: String?
    @NSManaged public var designation: String?
    @NSManaged public var avatar: String?
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var url: String?

}

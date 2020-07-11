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

    @NSManaged public var jsonresponse: Data?

}

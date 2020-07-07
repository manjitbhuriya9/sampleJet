//
//  CodingUserInfoKey+Util.swift
//  JetTravelDemo
//
//  Created by Organization on 06/07/20.
//  Copyright © 2020 Organization. All rights reserved.
//

import Foundation

public extension CodingUserInfoKey {
    // Helper property to retrieve the Core Data managed object context
    static let managedObjectContext = CodingUserInfoKey(rawValue: "managedObjectContext")
}

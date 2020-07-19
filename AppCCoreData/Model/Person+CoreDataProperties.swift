//
//  Person+CoreDataProperties.swift
//  AppCCoreData
//
//  Created by Nadia Mettioui on 18/07/2020.
//  Copyright © 2020 Sirania'Dev. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var gender: Bool
    @NSManaged public var age: Int64

}

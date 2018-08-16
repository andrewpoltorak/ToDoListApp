//
//  Entity+CoreDataProperties.swift
//  ToDoListApp
//
//  Created by Preferiti_mac on 16.08.18.
//  Copyright © 2018 Admin. All rights reserved.
//
//

import Foundation
import CoreData


extension Entity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity> {
        return NSFetchRequest<Entity>(entityName: "Entity")
    }

    @NSManaged public var name: String?
    @NSManaged public var comleted: Bool

}

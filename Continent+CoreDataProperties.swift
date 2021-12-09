//
//  Continent+CoreDataProperties.swift
//  test
//
//  Created by Hari krishna on 27/11/21.
//
//

import Foundation
import CoreData


extension Continent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Continent> {
        return NSFetchRequest<Continent>(entityName: "Continent")
    }

    @NSManaged public var continentId: Int16
    @NSManaged public var continentName: String?

}

extension Continent : Identifiable {

}

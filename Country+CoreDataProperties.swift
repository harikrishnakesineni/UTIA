//
//  Country+CoreDataProperties.swift
//  test
//
//  Created by Hari krishna on 27/11/21.
//
//

import Foundation
import CoreData


extension Country {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Country> {
        return NSFetchRequest<Country>(entityName: "Country")
    }

    @NSManaged public var countryId: Int16
    @NSManaged public var continentId: Int16
    @NSManaged public var countryName: String?
    @NSManaged public var countryDescription: String?
    @NSManaged public var countryImage: String?
}

extension Country : Identifiable {

}

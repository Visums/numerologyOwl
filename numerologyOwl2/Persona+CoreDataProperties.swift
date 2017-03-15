//
//  Persona+CoreDataProperties.swift
//  numerologyOwl2
//
//  Created by Reinis Kalnins on 10.03.17.
//  Copyright © 2017. g. Reinis Kalnins. All rights reserved.
//

import Foundation
import CoreData


extension Persona {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Persona> {
        return NSFetchRequest<Persona>(entityName: "Persona");
    }

    @NSManaged public var created: NSDate?
    @NSManaged public var bday: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var sname: String?

}

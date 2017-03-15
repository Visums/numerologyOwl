//
//  Persona+CoreDataClass.swift
//  numerologyOwl2
//
//  Created by Reinis Kalnins on 10.03.17.
//  Copyright © 2017. g. Reinis Kalnins. All rights reserved.
//

import Foundation
import CoreData

@objc(Persona)
public class Persona: NSManagedObject {

    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        self.created = NSDate()
        
        
    }
    
}

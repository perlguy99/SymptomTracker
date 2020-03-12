//
//  Trigger+CoreDataProperties.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/10/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//
//

import Foundation
import CoreData


extension Trigger {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Trigger> {
        return NSFetchRequest<Trigger>(entityName: "Trigger")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var instance: Instance?

}

extension Trigger: Identifiable { }

extension Trigger: Comparable {
    public static func < (lhs: Trigger, rhs: Trigger) -> Bool {
        lhs.getName() < rhs.getName()
    }
}


extension Trigger {
    
    var wrappedName: String {
        return name ?? "UNKNOWN2"
    }
    
    func getName() -> String {
        return name ?? "UNKNOWN"
    }
    
}

//
//  Symptom+CoreDataProperties.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/10/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//
//

import Foundation
import CoreData
import Combine

extension Symptom {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Symptom> {
        return NSFetchRequest<Symptom>(entityName: "Symptom")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var instances: NSOrderedSet?
}

// MARK: Generated accessors for instances
extension Symptom {

    @objc(insertObject:inInstancesAtIndex:)
    @NSManaged public func insertIntoInstances(_ value: Instance, at idx: Int)

    @objc(removeObjectFromInstancesAtIndex:)
    @NSManaged public func removeFromInstances(at idx: Int)

    @objc(insertInstances:atIndexes:)
    @NSManaged public func insertIntoInstances(_ values: [Instance], at indexes: NSIndexSet)

    @objc(removeInstancesAtIndexes:)
    @NSManaged public func removeFromInstances(at indexes: NSIndexSet)

    @objc(replaceObjectInInstancesAtIndex:withObject:)
    @NSManaged public func replaceInstances(at idx: Int, with value: Instance)

    @objc(replaceInstancesAtIndexes:withInstances:)
    @NSManaged public func replaceInstances(at indexes: NSIndexSet, with values: [Instance])

    @objc(addInstancesObject:)
    @NSManaged public func addToInstances(_ value: Instance)

    @objc(removeInstancesObject:)
    @NSManaged public func removeFromInstances(_ value: Instance)

    @objc(addInstances:)
    @NSManaged public func addToInstances(_ values: NSOrderedSet)

    @objc(removeInstances:)
    @NSManaged public func removeFromInstances(_ values: NSOrderedSet)

}


extension Symptom {
    
    public var wrappedName: String {
        name ?? ""
    }
    
    
}


extension Symptom: Identifiable { }


extension Symptom: Comparable {
    public static func < (lhs: Symptom, rhs: Symptom) -> Bool {
        lhs.wrappedName < rhs.wrappedName
    }
}

// Basically a View Model for the Instances of a Symptom
extension Symptom {
    
    // TODO: Convert this to a function that you can pass in the amount of days to
//    var filteredTypedInstances: [Instance] {
//        var calendar = Calendar.current
//        calendar.timeZone = NSTimeZone.local
//
//        let dateToday = calendar.startOfDay(for: Date())  // Today
//        let dateFrom  = calendar.date(byAdding: .day, value: -10, to: dateToday)  // last 10 days
//
//        let fromPredicate = NSPredicate(format: "dateTime >= %@", dateFrom! as NSDate)
//
//        guard let instances     = instances else { return [] }
//        guard let instanceArray = instances.array as? [Instance] else { return [] }
//
//        let nsInstances = instanceArray as NSArray
//        guard let filtered = nsInstances.filtered(using: fromPredicate) as? [Instance] else { return [] }
//
//        return filtered.sorted { $0.dateTime! > $1.dateTime! }
//    }
    
    func instancesForPast(days: Int, withSeverity severity: String = "ALL") -> [Instance] {
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local
        
        let dateToday     = calendar.startOfDay(for: Date())
        let dateFrom      = calendar.date(byAdding: .day, value: -days, to: dateToday)
        let fromPredicate = NSPredicate(format: "dateTime >= %@", dateFrom! as NSDate)
        
        // To store our filtered results
        var filtered = [Instance]()
        
        guard let instances     = instances else { return [] }
        guard let instanceArray = instances.array as? [Instance] else { return [] }
        
        let nsInstances = instanceArray as NSArray
        
        if severity == "ALL" {
            filtered = nsInstances.filtered(using: fromPredicate) as! [Instance]
        }
        else {
            let severityPredicate = NSPredicate(format: "severity == %@", severity)
            let combinedPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [fromPredicate, severityPredicate])
            
            filtered = nsInstances.filtered(using: combinedPredicate) as! [Instance]
        }
        
        return filtered
    }

    
    var typedInstances: [Instance] {
        guard let instances     = instances else { return [] }
        guard let instanceArray = instances.array as? [Instance] else { return [] }
        
        // Newest First
        return instanceArray.sorted { $0.dateTime! > $1.dateTime! }
    }
    
    var instanceCount: String {
        return "\(instances?.count ?? 0) instance(s)"
    }
    
    
    
}


// TODO: - Make a View Model for statistics
// ** Instances ordered by date, different color for each severity
// ** Instances ordered by date, all lumped together
// ** Instances ordered by date, by triggers
// ** Instances ordered by date, by triggers & severity



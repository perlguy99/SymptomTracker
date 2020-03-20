//
//  Instance+CoreDataProperties.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/10/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//
//
import SwiftUI
import Foundation
import CoreData


extension Instance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instance> {
        return NSFetchRequest<Instance>(entityName: "Instance")
    }

    @NSManaged public var dateTime: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var note: String?
    @NSManaged public var severity: String?
    @NSManaged public var symptoms: Symptom?
    @NSManaged public var trigger: NSOrderedSet?

}

// MARK: Generated accessors for trigger
extension Instance {

    @objc(insertObject:inTriggerAtIndex:)
    @NSManaged public func insertIntoTrigger(_ value: Trigger, at idx: Int)

    @objc(removeObjectFromTriggerAtIndex:)
    @NSManaged public func removeFromTrigger(at idx: Int)

    @objc(insertTrigger:atIndexes:)
    @NSManaged public func insertIntoTrigger(_ values: [Trigger], at indexes: NSIndexSet)

    @objc(removeTriggerAtIndexes:)
    @NSManaged public func removeFromTrigger(at indexes: NSIndexSet)

    @objc(replaceObjectInTriggerAtIndex:withObject:)
    @NSManaged public func replaceTrigger(at idx: Int, with value: Trigger)

    @objc(replaceTriggerAtIndexes:withTrigger:)
    @NSManaged public func replaceTrigger(at indexes: NSIndexSet, with values: [Trigger])

    @objc(addTriggerObject:)
    @NSManaged public func addToTrigger(_ value: Trigger)

    @objc(removeTriggerObject:)
    @NSManaged public func removeFromTrigger(_ value: Trigger)

    @objc(addTrigger:)
    @NSManaged public func addToTrigger(_ values: NSOrderedSet)

    @objc(removeTrigger:)
    @NSManaged public func removeFromTrigger(_ values: NSOrderedSet)

}


extension Instance {
    
    public var stringDateTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y @ HH:mm"
        
        if let date = dateTime {
            return formatter.string(from: date)
        }
        
        return "No Date"
    }
    
    public var wrappedSeverity: String {
        severity ?? ""
    }

    public var wrappedNote: String {
        note ?? ""
    }
    
    
    public var hasNote: Bool {
        (note != nil) ? true : false
    }
    
    public var hasTrigger: Bool {
        if trigger?.count ?? 0 > 0 {
            return true
        }
        
        return false
    }
    
    
    public var noteImage: Image {
        if hasNote {
            return Image(systemName: "checkmark.seal")
        }
        
        return Image(systemName: "checkmark.seal")
    }
    
    public var triggerImage: Image {
        if hasTrigger {
            return Image(systemName: "checkmark.seal")
                
        }
        else {
            return Image(systemName: "checkmark.seal")
        }
    }

    
    public var stringDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM y"
        
        if let date = dateTime {
            return formatter.string(from: date)
        }
        
        return "No Date"
    }
    
    public var stringTime: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        if let date = dateTime {
            return formatter.string(from: date)
        }
        
        return "No Time"
    }
    
}


extension Instance: Identifiable { }


extension Instance {
    var typedTrigger: [Trigger] {
        return (trigger?.array as? [Trigger]) ?? []
    }
}


extension Instance: Comparable {
    public static func < (lhs: Instance, rhs: Instance) -> Bool {
        if lhs.dateTime! < rhs.dateTime! {
            return true
        }
        
        return false
   }
    
     public static func > (lhs: Instance, rhs: Instance) -> Bool {
         if lhs.dateTime! > rhs.dateTime! {
             return true
         }
         
         return false
    }
    
}

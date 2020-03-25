//
//  Instance+CoreDataProperties.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/25/20.
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
//    @NSManaged public var severity: String?
    @NSManaged public var severity: Int16
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


// Total Instances for symptom

// Instances for symptom in last 1 day

// Instances for symptom in last 7 days

// Instances for symptom in last 30 days

// Instances for symptom in last 365 days



// Total Severe Instances for symptom

// Total Severe Instances for symptom in last 1 day

// Total Severe Instances for symptom in last 7 days

// Total Severe Instances for symptom in last 30 days

// Total Severe Instances for symptom in last 365 days



// Total Moderate Instances for symptom

// Total Moderate Instances for symptom in last 1 day

// Total Moderate Instances for symptom in last 7 days

// Total Moderate Instances for symptom in last 30 days

// Total Moderate Instances for symptom in last 365 days



// Total Low Instances for symptom

// Total Low Instances for symptom in last 1 day

// Total Low Instances for symptom in last 7 days

// Total Low Instances for symptom in last 30 days

// Total Low Instances for symptom in last 365 days



// Total Instances for symptom with X trigger

// Total Instances for symptom with X trigger in last 1 day

// Total Instances for symptom with X trigger in last 7 days

// Total Instances for symptom with X trigger in last 30 days

// Total Instances for symptom with X trigger in last 365 days



// Total Severe Instances for symptom with X trigger

// Total Severe Instances for symptom with X trigger in last 1 day

// Total Severe Instances for symptom with X trigger in last 7 days

// Total Severe Instances for symptom with X trigger in last 30 days

// Total Severe Instances for symptom with X trigger in last 365 days



// Total Moderate Instances for symptom with X trigger

// Total Moderate Instances for symptom with X trigger in last 1 day

// Total Moderate Instances for symptom with X trigger in last 7 days

// Total Moderate Instances for symptom with X trigger in last 30 days

// Total Moderate Instances for symptom with X trigger in last 365 days



// Total Low Instances for symptom with X trigger

// Total Low Instances for symptom with X trigger in last 1 day

// Total Low Instances for symptom with X trigger in last 7 days

// Total Low Instances for symptom with X trigger in last 30 days

// Total Low Instances for symptom with X trigger in last 365 days




extension Instance {
    
    
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instance> {
//        return NSFetchRequest<Instance>(entityName: "Instance")
//    }
    
    
    
    
    // NOTE: NEED TO ADD A WAY TO FILTER BY SYMTOM
    
     func fetchRequestAllInstancesLast7Days(currentSymptom: Symptom) -> NSFetchRequest<Instance> {
        let currentId   = currentSymptom.id!
        let mySymptomId = self.symptoms!.id!
        
        let symptomPredicate = NSPredicate(format: "%@ == %@", currentId.uuidString, mySymptomId.uuidString)
        
        var calendar = Calendar.current
        calendar.timeZone = NSTimeZone.local
        
        let dateToday = calendar.startOfDay(for: Date())  // Today
        let dateFrom  = calendar.date(byAdding: .day, value: -7, to: dateToday)
//        let dateTo    = dateToday
        
        let fromPredicate = NSPredicate(format: "%@ >= %@", dateTime! as NSDate, dateFrom! as NSDate)
//        let toPredicate   = NSPredicate(format: "%@ < %@", dateTime! as NSDate, dateTo as NSDate)
        
//        let fr = FetchRequest<NSFetchRequestResult>(entity: Instance.entity(), sortDescriptors: [])
        
        let fr2 = NSFetchRequest<Instance>(entityName: "Instance")
//        fr2.predicate = fromPredicate
        
        let compound = NSCompoundPredicate(andPredicateWithSubpredicates: [symptomPredicate, fromPredicate])
        fr2.predicate = compound
        
        return fr2
    }
    
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
        severityString(forSeverity: Severity(rawValue: UInt16(severity)) ?? Severity(rawValue: 0)! )
//        severity ?? ""
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



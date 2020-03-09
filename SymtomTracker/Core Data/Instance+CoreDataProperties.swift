//
//  Instance+CoreDataProperties.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//
//

import Foundation
import CoreData
import SwiftUI

extension Instance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Instance> {
        return NSFetchRequest<Instance>(entityName: "Instance")
    }

    @NSManaged public var dateTime: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var note: String?
    @NSManaged public var trigger: String?
    @NSManaged public var severity: String?
    @NSManaged public var ofSymptom: Symptom?
    @NSManaged public var symptomId: UUID?

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
    
    public var wrappedTrigger: String {
        trigger ?? ""
    }
    
    public var hasNote: Bool {
        (note != nil) ? true : false
    }
    
    public var hasTrigger: Bool {
        (trigger != nil) ? true : false
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

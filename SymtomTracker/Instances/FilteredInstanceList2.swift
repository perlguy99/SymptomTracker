//
//  FilteredInstanceList2.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/10/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct FilteredInstanceList2: View {
//    var fetchRequest: FetchRequest<Instance>
    var symptom: Symptom
    
    @Environment(\.managedObjectContext) var context
    
    
//    @FetchRequest(
//        entity: Instance.entity(),
//        sortDescriptors: [],
//        predicate: NSPredicate(, animation: <#T##Animation?#>)
    
    var body: some View {
        
//        ForEach(symptom.instances?.array as! [Instance], id: \.self) { instance in
        ForEach(symptom.typedInstances, id: \.self) { instance in
            HStack {
                NavigationLink(destination: InstanceDetailView(instance: instance)) {
                    InstanceCell(instance: instance)
                }
            }
        }
        .onDelete(perform: removeItems)
    }
    
    
//    init(filter: UUID) {
//        fetchRequest = FetchRequest<Instance>(entity: Instance.entity(), sortDescriptors: [NSSortDescriptor(key: "dateTime", ascending: false)], predicate: NSPredicate(format: "symptomId = %@", filter))
//    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let foo = symptom.typedInstances[index]
//            let foo = symptom.instances?.array[index] as! Instance
//            let foo = fetchRequest.wrappedValue[index]
            context.delete(foo)
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}


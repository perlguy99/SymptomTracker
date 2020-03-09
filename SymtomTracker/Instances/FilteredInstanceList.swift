//
//  FilteredInstanceList.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/6/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct FilteredInstanceList: View {
    var fetchRequest: FetchRequest<Instance>
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var body: some View {
        ForEach(fetchRequest.wrappedValue, id: \.self) { instance in
            HStack {
                InstanceCell(instance: instance)
            }
        }
        .onDelete(perform: removeItems)
    }
    
    
    init(filter: UUID) {
        fetchRequest = FetchRequest<Instance>(entity: Instance.entity(), sortDescriptors: [NSSortDescriptor(key: "dateTime", ascending: false)], predicate: NSPredicate(format: "symptomId = %@", filter))
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let foo = fetchRequest.wrappedValue[index]
            context.delete(foo)
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}


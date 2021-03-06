//
//  FilteredInstanceList.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/10/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData


struct FilteredInstanceList: View {
    @Environment(\.managedObjectContext) var context
    var symptom: Symptom

    @ObservedObject var sortArrow = SortArrow.shared
    
    // Note: - Needed to keep the list refreshing
    @State var refreshing = false
    var didSave = NotificationCenter.default.publisher(for: .NSManagedObjectContextDidSave)
    // Note: - Needed to keep the list refreshing

    
    var body: some View {
        // NEWEST FIRST
        if self.sortArrow.ascending == true {
            
            return ForEach(symptom.typedInstances.sorted(by: <), id: \.self) { instance in
                
                VStack {
                    NavigationLink(destination: InstanceDetailView(instance: instance)) {
                        InstanceCell(instance: instance)
                        Text((self.refreshing ? "" : ""))
                    }
                    // Note: - Needed to keep the list refreshing
                    .onReceive(self.didSave) { _ in
                        self.refreshing.toggle()
                    }
                }
                
            }
            .onDelete(perform: removeItems)
        }
        
        else {
            return ForEach(symptom.typedInstances.sorted(by: >), id: \.self) { instance in
                
                VStack {
                    NavigationLink(destination: InstanceDetailView(instance: instance)) {
                        InstanceCell(instance: instance)
                        Text((self.refreshing ? "" : ""))
                    }
                    // Note: - Needed to keep the list refreshing
                    .onReceive(self.didSave) { _ in
                        self.refreshing.toggle()
                    }
                }
                
            }
            .onDelete(perform: removeItems)
        }
    }
    
    

    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let foo = symptom.typedInstances[index]
            symptom.removeFromInstances(foo)
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}





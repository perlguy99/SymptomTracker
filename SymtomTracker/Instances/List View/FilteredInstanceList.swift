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

    @State var ascending = false
    
    // Note: - Needed to keep the list refreshing
    @State var refreshing = false
    var didSave = NotificationCenter.default.publisher(for: .NSManagedObjectContextDidSave)
    // Note: - Needed to keep the list refreshing
    
    
//    func instanceViewRow(_ instance: Instance) -> some View {
//        return VStack {
//            NavigationLink(destination: InstanceDetailView(instance: instance)) {
//                InstanceCell(instance: instance)
//                Text((self.refreshing ? "" : ""))
//            }
//                // Note: - Needed to keep the list refreshing
//                .onReceive(self.didSave) { _ in
//                    self.refreshing.toggle()
//            }
//        }
//    }
    
    var body: some View {
        
//        func instanceViewRow(_ instance: Instance) -> some View {
//
//            return VStack {
//                NavigationLink(destination: InstanceDetailView(instance: instance)) {
//                    InstanceCell(instance: instance)
//                    Text((self.refreshing ? "" : ""))
//                }
//                    // Note: - Needed to keep the list refreshing
//                    .onReceive(self.didSave) { _ in
//                        self.refreshing.toggle()
//                }
//            }
//        }
        
        
        if ascending == true {
            
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
            .onAppear(perform: printItemsForDebugging)
        }
        
        else {
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
            .onAppear(perform: printItemsForDebugging)
        }
            
            
//        .onDelete(perform: removeItems)
    }
    
    
    func printItemsForDebugging() {
        
//        let days3  = symptom.instancesForPast(days: 3)
//        let days7  = symptom.instancesForPast(days: 7)
//        let days10 = symptom.instancesForPast(days: 10)
//        let days14 = symptom.instancesForPast(days: 14)
        let days30 = symptom.instancesForPast(days: 30)
        
        let days30l = symptom.instancesForPast(days: 30, withSeverity: "Low")
        let days30m = symptom.instancesForPast(days: 30, withSeverity: "Moderate")
        let days30s = symptom.instancesForPast(days: 30, withSeverity: "Severe")
        
//        print("\n3:\n")
//        print(String(repeating: "-", count: 40))
//        for item in days3 {
//            print(item.stringDateTime, item.wrappedSeverity)
//        }
//        print(String(repeating: "-", count: 40))
//        print("\n")
//
//        print("\n7:\n")
//        print(String(repeating: "-", count: 40))
////        print(days7)
//        for item in days7 {
//            print(item.stringDateTime, item.wrappedSeverity)
//        }
//
//        print(String(repeating: "-", count: 40))
//        print("\n")
//
//        print("\n10:\n")
//        print(String(repeating: "-", count: 40))
//        for item in days10 {
//            print(item.stringDateTime, item.wrappedSeverity)
//        }
//
//        print(String(repeating: "-", count: 40))
//        print("\n")
//
//        print("\n14:\n")
//        print(String(repeating: "-", count: 40))
//        for item in days14 {
//            print(item.stringDateTime, item.wrappedSeverity)
//        }
//
//        print(String(repeating: "-", count: 40))
//        print("\n")

        print("\n30:\n")
        print(String(repeating: "-", count: 40))
        for item in days30 {
            print(item.stringDateTime, item.wrappedSeverity)
        }
        
        print(String(repeating: "-", count: 40))
        
        print("All Count: \(days30.count)")
        print("Low Count: \(days30l.count)")
        print("Moderate Count: \(days30m.count)")
        print("Severe Count: \(days30s.count)")

        print(String(repeating: "-", count: 40))
        print("\n")

        
        
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





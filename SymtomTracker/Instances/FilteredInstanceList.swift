//
//  FilteredInstanceList.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/10/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct FilteredInstanceList: View {
    @Environment(\.managedObjectContext) var context
    
    var symptom: Symptom
    
//    @State var needRefresh: Bool = false
    
    @State var instances: [Instance] = [Instance]()
    
    
    var body: some View {

        ForEach(symptom.typedInstances, id: \.self) { instance in
            HStack {
                NavigationLink(destination: InstanceDetailView(instance: instance)) {
                    InstanceCell(instance: instance)
                }
            }
        }
        .onDelete(perform: removeItems)
    }
    
//    var body: some View {
//
////        VStack {
//
//            ForEach(instances, id: \.self) { instance in
////                NavigationLink(destination: InstanceDetailView(instance: instance, needRefresh: self.$needRefresh)) {
//                NavigationLink(destination: InstanceDetailView(instance: instance)) {
//                        InstanceCell(instance: instance)
//                    }
//            }
//            .onDelete(perform: removeItems)
////        }
//
//        .onAppear(perform: {
//            self.loadInstances()
//        })
//
//    }


    
    
    func loadInstances() {
        self.instances = self.symptom.typedInstances
        print("\n")
        print(self.instances)
    }
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let foo = symptom.typedInstances[index]
            context.delete(foo)
        }
        
        do {
            try context.save()
            
            self.loadInstances()
        } catch {
            print(error.localizedDescription)
        }
    }
}



//var body: some View {
//
//    ForEach(symptom.typedInstances, id: \.self) { instance in
//        HStack {
//            NavigationLink(destination: InstanceDetailView(instance: instance)) {
//                InstanceCell(instance: instance)
//            }
//        }
//    }
//    .onDelete(perform: removeItems)
//}

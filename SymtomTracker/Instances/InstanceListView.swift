//
//  InstanceListView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

struct InstanceListView: View {
    @Environment(\.managedObjectContext) var context
    
    var symptom: Symptom
    
    @ObservedObject var ti = TypedInstances()
    
    @State var ist: [Instance] = []
    
//    @State var needRefresh: Bool = false
    
    var body: some View {
        VStack {
            InstanceCellHeader()
            
            List(ist, id: \.self) { instance in
//                FilteredInstanceList(symptom: symptom)
//                ForEach(instances, id: \.self) { instance in
//                NavigationLink(destination: InstanceDetailView(instance: instance, needRefresh: self.$needRefresh)) {
                NavigationLink(destination: InstanceDetailView(instance: instance)) {
                            InstanceCell(instance: instance)
                        }
//                }
//                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("\(symptom.wrappedName) Instances")
            .navigationBarItems(trailing:
                NavigationLink(destination: AddInstanceView(symptom: symptom) ) {
                    Text("Add")
                }
            )
        }
        .onAppear(perform: {
//            self.symptom
            self.loadInstances()
        })
    }
    
    
    func loadInstances() {
        for instance in symptom.typedInstances {
            ist.append(instance)
        }
//        ist = symptom.typedInstances
//        ti.instances = symptom.typedInstances
        
        
//        theSymptom = symptom
//        instances = []
//
//        let fooInstance = Instance(context: context)
//        fooInstance.id = UUID()
//        fooInstance.dateTime = Date()
//        fooInstance.note = "fooInstance Note"
//
//        instances.append(fooInstance)
//
////        for instance in self.symptom.typedInstances {
////            instances.append(instance)
////        }
//
////        self.instances = self.symptom.typedInstances
//        print("\n")
//        print(self.instances)
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


//
//  InstanceListView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

//import SwiftUI
//import CoreData
//
//struct InstanceListView: View {
//    let symptom: Symptom
//
//
////    @EnvironmentObject var selectedTriggersEnv: SelectedItems
//
//    var body: some View {
//        VStack {
//            InstanceCellHeader()
//
//            List {
//                FilteredInstanceList(symptom: symptom)
//            }
//            .navigationBarTitle("\(symptom.wrappedName) Instances")
//            .navigationBarItems(trailing:
//                NavigationLink(destination: AddInstanceView(symptom: symptom) ) {
//                    Text("Add")
//                }
//            )
//        }
//    }
//}
//

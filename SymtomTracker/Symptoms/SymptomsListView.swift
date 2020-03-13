//
//  SymptomsListView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

struct SymptomsListView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Symptom.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var symptoms: FetchedResults<Symptom>
    
//    @EnvironmentObject var selectedTriggersEnv: SelectedItems
    
    var body: some View {
        List {
            Section(header: Text("Tracked Symptoms")) {
                
                ForEach(symptoms, id: \.self) { symptom in
                    NavigationLink(destination: InstanceView(symptom: symptom)) {
                        HStack {
                            Text(symptom.wrappedName)
                            Spacer()
                            Text(symptom.instanceCount).font(.caption)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
        }
        
    }
    
    
    func getFetchRequest(symptom: Symptom) -> FetchRequest<Symptom> {

//        let fr = NSFetchRequest(entity: Symptom.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id == %@", symptom.id!))

        
//        let foo = FetchRequest<NSFetchRequestResult>(entity: Symptom.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id == %@", symptom.id!))
        let bar = FetchRequest<Symptom>(entity: Symptom.entity(), sortDescriptors: [], predicate: NSPredicate(format: "id == %@", symptom.id!))
        
        return bar
    }
    
    
    func removeItems(at offsets: IndexSet) {
        for index in offsets {
            let symptom = symptoms[index]
            context.delete(symptom)
        }
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}

struct SymptomsListView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsListView()
    }
}


extension UUID: CVarArg {}

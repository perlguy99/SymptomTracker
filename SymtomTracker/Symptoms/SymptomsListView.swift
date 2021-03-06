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
    
    var body: some View {
        List {
            Section(header: Text("Tracked Symptoms")) {
                ForEach(symptoms, id: \.self) { symptom in
                    
                    // TODO: Using this, the rows DON'T auto-update
//                    SymptomRow(symptom: symptom)
                    
                    // TODO: Using this, the rows DO auto-update
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

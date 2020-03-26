//
//  StatisticsChoiceView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/26/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

struct StatisticsChoiceView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Symptom.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var symptoms: FetchedResults<Symptom>
    
    @ObservedObject var selectedItems = SelectedItems<Symptom>()
    
    var body: some View {
        
        NavigationView {
            VStack {
                Spacer()
                Text("")
                Text("Choose which symptoms to display statistics for").font(.headline)
                
                Section(header: Text("Choose Symptoms")) {
                    NavigationLink(destination: SelectStatisticsView(context: context, selectedItems: selectedItems) ) {
                        Text("Select Symptoms")
                    }
                }
                
                
                Section(header: Text("Selected Symptoms")) {
                    HStack {
                        if self.selectedItems.items.count > 0 {
                            ForEach(self.selectedItems.items) { item in
                                Text(item.wrappedName)
                                    .modifier(TagText())
                            }
                        }
                        else {
                            Text("None")
                                .modifier(TagText())
                        }
                    }
                }
                
                
                Spacer()
            
//            List {
//                Section(header: Text("Select For Statistics")) {
//
//
//
//                    ForEach(symptoms, id: \.self) { symptom in
//
////                    NavigationLink(destination: InstanceView(symptom: symptom)) {
//
//                        HStack {
//                            Text(symptom.wrappedName)
//                            Spacer()
//                            Text(symptom.instanceCount).font(.caption)
//
//                        }
////                    }  // NavigationLink
//
//                    }
//                    .onDelete(perform: removeItems)
//                }  // Section
//
//
//
//            }  // List
            
            } // VStack
     
        } // NavigationView
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


struct StatisticsChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsChoiceView()
    }
}

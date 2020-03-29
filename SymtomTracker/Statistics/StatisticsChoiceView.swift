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
                
                Divider()
                
                Section {
                    NavigationLink(destination: SelectStatisticsView(context: context, selectedItems: selectedItems) ) {
                        Text("Tap to Select Symptoms")
                    }
                }
                .padding()
                Divider()
                
                Section(header: Text("Selected Symptoms").font(.largeTitle)) {
                    VStack {
                        HStack {
                            
                            if self.selectedItems.items.count > 0 {
                                ForEach(self.selectedItems.items) { item in
                                    Text(item.wrappedName)
                                        .modifier(TagText(titleFont: .body, paddingLeadingTrailing: 9, paddingTopBottom: 4))
                                }
                            }
                            else {
                                Text("None")
                                    .modifier(TagText(bgColor: Color.orange.opacity(0.75), titleFont: .body, paddingLeadingTrailing: 9, paddingTopBottom: 4))
                            }
                        }
                    }
                }
                .padding()
                
                Spacer()
            
            } // VStack
            .navigationBarTitle(Text("Choose Symptoms"))
            
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

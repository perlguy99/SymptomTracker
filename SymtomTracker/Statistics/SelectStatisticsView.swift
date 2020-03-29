//
//  SelectStatisticsView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/26/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

extension Symptom: MultiSelectable {
    var title: String {
        get {
            return wrappedName
        }
    }
    
    public static func < (lhs: Symptom, rhs: Symptom) -> Bool {
        lhs.wrappedName < rhs.wrappedName
    }
}


struct SelectStatisticsView: View {
    @FetchRequest(entity: Symptom.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var symptoms: FetchedResults<Symptom>
    @Environment(\.presentationMode) var presentationMode
    
    let context: NSManagedObjectContext
    let selectedItems: SelectedItems<Symptom>
    
    var body: some View {
        VStack {
            Spacer()
            
            Section {
                
                if symptoms.isEmpty {
                    Text("No Symptoms to choose from!")
                }
                else {
                    MultipleSelectionList2(selectedItems: selectedItems, items: symptoms.reversed())
                }
            }
            
            ButtonCenteredText(title: "Done", handler: { self.presentationMode.wrappedValue.dismiss() })
                .padding([.bottom], 25)
        }
    }
}




struct SelectStatisticsView_Previews: PreviewProvider {
    
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let symptom1 = Symptom(context: context)
        symptom1.id = UUID()
        symptom1.name = "Test Symptom"
        
        let selectedItems: SelectedItems<Symptom> = SelectedItems<Symptom>()
        selectedItems.addItem(symptom1)
        
        return SelectStatisticsView(context: context, selectedItems: selectedItems).environment(\.managedObjectContext, context)
    }
}

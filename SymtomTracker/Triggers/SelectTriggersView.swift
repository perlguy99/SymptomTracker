//
//  SelectTriggersView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/13/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

struct SelectTriggersView: View {
    @FetchRequest(entity: Trigger.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var triggers: FetchedResults<Trigger>
    @Environment(\.presentationMode) var presentationMode
    
    let context: NSManagedObjectContext
    let selectedTriggers: SelectedItems<Trigger>
    
    var body: some View {
        VStack {
            Spacer()
            
            Section {
                
                if triggers.isEmpty {
                    Text("Please add a trigger")
                }
                else {
                    MultipleSelectionList(selectedItems: selectedTriggers, items: triggers)

                }
            }
            
            ButtonCenteredText(title: "Done", handler: { self.presentationMode.wrappedValue.dismiss() })
            
            Spacer()
            
        }
    .navigationBarTitle(Text("Possible Triggers"))
        .navigationBarItems(trailing:
            NavigationLink(destination: AddTriggerView(context: self.context)) {
                Text("Add")
        })
        
    }
}

//struct SelectTriggersView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectTriggersView()
//    }
//}

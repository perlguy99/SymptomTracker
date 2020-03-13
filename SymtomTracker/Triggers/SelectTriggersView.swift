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
            Text("Select Triggers")
            
            Section(header: Text("Possible Triggers")) {
                if triggers.isEmpty {
                    Text("Please add a trigger")
                }
                else {
                    MultipleSelectionList(selectedTriggers: selectedTriggers, triggers: triggers)
                }
            }
            
            ButtonCenteredText(title: "Done", handler: { self.presentationMode.wrappedValue.dismiss() })
            
            Spacer()
            
        }
        .onAppear(perform: {
            print("\nA")
            self.printValues()
        })
            .onDisappear(perform: {
                print("\nD")
                self.printValues()
            })
        
    }
    
    func printValues() {
        print("--------")
        print(selectedTriggers.items)
        print("-----------\n")
    }
    
}

//struct SelectTriggersView_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectTriggersView()
//    }
//}

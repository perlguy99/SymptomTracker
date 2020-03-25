//
//  AddTriggerView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/11/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

struct AddTriggerView: View {
    let context: NSManagedObjectContext
    @FetchRequest(entity: Trigger.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var triggers: FetchedResults<Trigger>
    @Environment(\.presentationMode) var presentationMode
    @State private var triggerName = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Trigger Name")) {
                    TextField("Trigger", text: $triggerName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Section {
                    ButtonCenteredText(title: "Done", handler: self.buttonTapped)
                }
            }
        }
        .navigationBarTitle("Add New Trigger")
        .onDisappear(perform: addTrigger)
    }
    
    
    func buttonTapped() {
        print("\nButton Tapped\n")
        self.presentationMode.wrappedValue.dismiss()
    }
    
    
    func addTrigger() {
        print("\nADD TRIGGER\n")
        
        if !triggerName.isEmpty {
            let trigger = Trigger(context: context)
            trigger.id = UUID()
            trigger.name = triggerName
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}


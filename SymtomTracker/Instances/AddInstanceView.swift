//
//  AddInstanceView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

struct AddInstanceView: View {
    @Environment(\.managedObjectContext) var context
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(entity: Trigger.entity(), sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)]) var triggers: FetchedResults<Trigger>
    
    @State private var dateTime: Date    = Date()
    @State private var intensity         = ""
    @State private var note: String      = ""
    @State private var trigger: String   = ""
    @State private var selectedIntensity = 0
    
    @State private var selectedTrigger   = 999
    
    @EnvironmentObject var selectedTriggersEnv: SelectedTriggers
    
    var symptom: Symptom
    var intensityArray = ["Low", "Moderate", "Severe"]
    
    var body: some View {
        
        VStack {
            Text("Add New Instance").font(.largeTitle)
            
            Form {
                Section(header: Text("Date of Instance")) {
                    VStack {
                        DatePicker(selection: $dateTime, in: ...Date()) {
                            Text("Date")
                        }
                    }
                }
                
                Section(header: Text("Severity/Intensity")) {
                    Picker("Intensity", selection: $selectedIntensity) {
                        ForEach(0..<intensityArray.count) {
                            Text(self.intensityArray[$0])
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Notes")) {
                    TextField("Note", text: $note)
                }
                
                
                Section(header: Text("Possible Triggers")) {
                    if triggers.isEmpty {
                        Text("Please add a trigger")
                    }
                    else {
                        MultipleSelectionList(triggers: triggers)
                    }
                }
                
                Section(header: Text("Chosen Triggers")) {
                    HStack {
                        ForEach(self.selectedTriggersEnv.triggers) { item in
                            Text(item.wrappedName)
                        }
                    }
                }
                
                Section(header: Text("Add a Trigger")) {
                    NavigationLink(destination: AddTriggerView(context: self.context)) {
                        Text("Add New Trigger Item")
                    }

                }
                
                ButtonCenteredText(title: "Done", handler: self.addInstance)
            }
        }
        .onAppear(perform: {
            self.clearTriggers()
        })
    }
    
    
    func clearTriggers() {
        selectedTriggersEnv.triggers = []
    }
    
    
    func buttonTapped() {
        print("\nButton Tapped\n")
        self.presentationMode.wrappedValue.dismiss()
    }
    
    
    func addInstance() {
        print("\nADD INSTANCE\n")
        
        let instance = Instance(context: context)
        instance.id        = UUID()
        
        if !note.isEmpty {
            instance.note     = note
        }
        
        instance.dateTime = dateTime
        instance.severity = intensityArray[selectedIntensity]
        
        for trigger in selectedTriggersEnv.triggers {
            instance.addToTrigger(trigger)
        }
        
        symptom.addToInstances(instance)
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
}


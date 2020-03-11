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
    
    var symptom: Symptom
    var intensityArray = ["Low", "Moderate", "Severe"]
    
    var body: some View {
        
        VStack {
            Text("Add New Instance").font(.largeTitle)
            
            Form {
                Section(header: Text("Date")) {
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
                
                Section(header: Text("Possible Trigger")) {
                    NavigationLink(destination: AddTriggerView(context: self.context)) {
                        Text("Add New Trigger Item")
                    }
                    
                    
                    if triggers.isEmpty {
                        Text("Please add a trigger")
                    }
                    else {
                        Picker("Trigger", selection: $selectedTrigger) {
                            Text("None").tag(999)
                            
                            ForEach(0..<triggers.count) { index in
                                Text(self.triggers[index].name ?? "NoName").tag(index)
                            }
                        }
                        
                        if selectedTrigger > self.triggers.count {
                            Text("You selected: None")
                        }
                        else {
                            Text("You selected: \(self.triggers[selectedTrigger].name ?? "")")
                        }
                        
                    }
                }
                
                ButtonCenteredText(title: "Add Instance", handler: self.addInstance)
            }
        }
    }
    
    
    func buttonTapped() {
        print("\nButton Tapped\n")
        self.presentationMode.wrappedValue.dismiss()
    }
    
    
    func addInstance() {
        print("\nADD INSTANCE\n")
        
        if !note.isEmpty {
            let instance = Instance(context: context)
            instance.id        = UUID()
            
            instance.note     = note
            instance.dateTime = dateTime
            instance.severity = intensityArray[selectedIntensity]
            
            symptom.addToInstances(instance)
            
            do {
                try context.save()
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print(error.localizedDescription)
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
}


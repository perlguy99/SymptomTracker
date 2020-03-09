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
    
    @State private var dateTime: Date    = Date()
    @State private var intensity         = ""
    @State private var note: String      = ""
    @State private var trigger: String   = ""
    @State private var selectedIntensity = 0
    
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
                    
                    TextField("Note", text: $note)
                    TextField("Trigger", text: $trigger)
                }
                
                Button(action: {
                    self.addInstance()
                }) {
                    HStack {
                        Spacer()
                        Text("Add Instance")
                        Spacer()
                    }
                }
            }
        }
    }
    
    
    func addInstance() {
        let instance = Instance(context: context)
        instance.id        = UUID()
        instance.symptomId = symptom.id
        
        if !note.isEmpty {
            instance.note = note
        }
        
        if !trigger.isEmpty {
            instance.trigger = trigger
        }
        
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
}


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
    
    @ObservedObject var selectedTriggers = SelectedItems<Trigger>()
    
    var symptom: Symptom
    var intensityArray = Severity.allCases.map { severityString(forSeverity: $0) }
    
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
                
                Section(header: Text("Choose Possible Triggers")) {
                    NavigationLink(destination: SelectTriggersView(context: context, selectedTriggers: selectedTriggers)) {
                        Text("Select Triggers")
                    }
                }
                
                Section(header: Text("Selected Triggers")) {
                    HStack {
                        if self.selectedTriggers.items.count > 0 {
                            ForEach(self.selectedTriggers.items) { item in
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
                ButtonCenteredText(title: "Done", handler: self.addInstance)
            }
        }
    }
    
    
    func addInstance() {
        print("\nADD INSTANCE\n")
        
        let instance = Instance(context: context)
        instance.id        = UUID()
        
        if !note.isEmpty {
            instance.note     = note
        }
        
        instance.dateTime = dateTime
        instance.severity = Int16(selectedIntensity)
        
        for trigger in selectedTriggers.items {
            instance.addToTrigger(trigger)
        }
        
        symptom.addToInstances(instance)
        symptom.managedObjectContext?.refresh(symptom, mergeChanges: true)
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
        self.presentationMode.wrappedValue.dismiss()
    }
}



struct TagText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .padding([.leading, .trailing], 5)
            .padding([.top, .bottom], 2)
            .background(Color.blue.opacity(0.5))
            .cornerRadius(.infinity)
    }
}

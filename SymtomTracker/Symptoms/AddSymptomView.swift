//
//  AddSymptomView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

struct AddSymptomView: View {
    let context: NSManagedObjectContext
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var symptomName = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Symptom Name")) {
                    TextField("Symptom", text: $symptomName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                
                Section {
                    Button(action: buttonTapped) {
                        HStack {
                            Spacer()
                            Text("Done")
                            Spacer()
                        }
                    }
                }
            }
            
        }
        .navigationBarTitle("Add New Symptom")
        .onDisappear(perform: addSymptom)
    }
    
    
    func buttonTapped() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
    func addSymptom() {
        let symptom = Symptom(context: context)
        symptom.id = UUID()
        
        if !symptomName.isEmpty {
            symptom.name = symptomName
            
            do {
                try context.save()
                self.presentationMode.wrappedValue.dismiss()
            } catch {
                print(error.localizedDescription)
                self.presentationMode.wrappedValue.dismiss()
            }
        }
        else {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
}



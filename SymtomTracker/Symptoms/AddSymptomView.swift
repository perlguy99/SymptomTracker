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
                    ButtonCenteredText(title: "Done", handler: self.buttonTapped)
                }
            }
        }
        .navigationBarTitle("Add New Symptom")
        .onDisappear(perform: addSymptom)
    }
    
    
    func buttonTapped() {
        print("\nButton Tapped\n")
        self.presentationMode.wrappedValue.dismiss()
    }
    
    
    func addSymptom() {
        print("\nADD SYMPTOM\n")
        
        if !symptomName.isEmpty {
            let symptom = Symptom(context: context)
            symptom.id   = UUID()
            symptom.name = symptomName
            
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}


struct AddSymptomView_Previews: PreviewProvider {
    static var previews: some View {
        return AddSymptomView(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
    }
}

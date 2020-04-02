//
//  InstanceDetailView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/9/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct InstanceDetailView: View {
    let instance: Instance
    
    var body: some View {
        VStack {
            Text("Instance Details")
                .font(.largeTitle)
            
            Form {
                
                Section(header: Text("Date of instance")) {
                    HStack {
                        Text(instance.stringDateTime)
                    }
                }
                
                Section(header: Text("Severity")) {
                    Text(instance.wrappedSeverity)
                }
                
                Section(header: Text("Notes")) {
                    Text(instance.wrappedNote)
                }

                Section(header: Text("Possible Triggers")) {
                    
                    if instance.hasTrigger {
                        TriggerCell(triggers: instance.typedTrigger.sorted())
                    }
                    else {
                        Text("No Triggers Selected").font(.caption)
                    }
                }
            }
        }
        .onDisappear(perform: {
        })
    }
}


struct InstanceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let instance = Instance(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        
        instance.dateTime = Date()
        instance.note = "Instance Note"

        return InstanceDetailView(instance: instance)
    }
}

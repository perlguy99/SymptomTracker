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
//    @Binding var needRefresh: Bool
    
    var body: some View {
        VStack {
            Text("Instance Details")
//            Text("\(instance.ofSymptom?.wrappedName ?? "") Instance")
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
//            self.needRefresh.toggle()
        })
    }
}


//struct InstanceDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        InstanceDetailView()
//    }
//}

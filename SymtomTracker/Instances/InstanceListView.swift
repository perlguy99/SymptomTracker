//
//  InstanceListView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

struct InstanceListView: View {
    let symptom: Symptom

    @EnvironmentObject var selectedTriggersEnv: SelectedTriggers
    
    var body: some View {
        VStack {
            InstanceCellHeader()
            
            List {
                FilteredInstanceList2(symptom: symptom)
            }
            .navigationBarTitle("\(symptom.wrappedName) Instances")
            .navigationBarItems(trailing:
                NavigationLink(destination: AddInstanceView(symptom: symptom) ) {
                    Text("Add")
                }
            )
        }
    }
}


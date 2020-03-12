//
//  InstanceView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct InstanceView: View {
    let symptom: Symptom
    @EnvironmentObject var selectedTriggersEnv: SelectedTriggers
    
    init(symptom: Symptom) {
        self.symptom = symptom
    }
    
    var body: some View {
        if symptom.instances?.count ?? 0 > 0 {
            return AnyView(InstanceListView(symptom: symptom))
        }
        
        return AnyView(EmptyInstanceView(symptom: symptom))
    }
}



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
    var fetchRequest: FetchRequest<Instance>
    
    init(symptom: Symptom) {
        self.symptom = symptom
        fetchRequest = FetchRequest<Instance>(entity: Instance.entity(), sortDescriptors: [], predicate: NSPredicate(format: "symptomId = %@", self.symptom.wrappedId))
    }
    
    var body: some View {
        if fetchRequest.wrappedValue.count > 0 {
            return AnyView(InstanceListView(symptom: symptom))
        }
        
        return AnyView(EmptyInstanceView(symptom: symptom))
    }
}



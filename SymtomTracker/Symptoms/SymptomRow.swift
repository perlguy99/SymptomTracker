//
//  SymptomRow.swift
//  SymtomTracker
//
//  Created by Brent Michalski on 4/1/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

// TODO: When instanceCount is updated, the UI doesn't update automatically
struct SymptomRow: View {
    var symptom: Symptom
    
    var body: some View {
        NavigationLink(destination: InstanceView(symptom: symptom)) {
            HStack {
                Text(symptom.wrappedName)
                Spacer()
                Text(symptom.instanceCount).font(.caption)
            }
        }
    }
}

struct SymptomRow_Previews: PreviewProvider {
    static var previews: some View {
        let symptom  = Symptom(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        symptom.name = "Test Symptom Name"

        return SymptomRow(symptom: symptom)
    }
}

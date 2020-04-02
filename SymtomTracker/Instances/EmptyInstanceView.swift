//
//  EmptyInstanceView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct EmptyInstanceView: View {
    let symptom: Symptom
    
    var body: some View {
        
        Text("No instances to display")
            .navigationBarTitle("Instances")
            .navigationBarItems(trailing:
                NavigationLink(destination: AddInstanceView(symptom: symptom) ) {
                    Text("Add")
                }
        )
    }
}

struct EmptyInstanceView_Previews: PreviewProvider {
    static var previews: some View {
        let symptom  = Symptom(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        symptom.name = "Test Symptom"

        return EmptyInstanceView(symptom: symptom)
    }
}

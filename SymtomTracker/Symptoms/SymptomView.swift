//
//  SymptomView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct SymptomView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Symptom.entity(), sortDescriptors: []) var symptoms: FetchedResults<Symptom>
    
//    @EnvironmentObject var selectedTriggersEnv: SelectedItems
    
    var body: some View {
        if symptoms.count > 0 {
            return AnyView(SymptomsListView())
        }
        
        return AnyView(EmptySymptomsView())
    }
}

struct SymptomView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomView()
    }
}

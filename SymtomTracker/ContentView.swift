//
//  ContentView.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/5/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    @FetchRequest(entity: Symptom.entity(), sortDescriptors: []) var symptoms: FetchedResults<Symptom>
    
    @State private var showingAddSymptomView = false
    @State var selectedView = 0
    
    var body: some View {
        
        TabView(selection: $selectedView) {
//        TabView {
            
            NavigationView {
                SymptomView()
                    .navigationBarTitle("Symptoms")
                    .navigationBarItems(trailing:
                        NavigationLink(destination: AddSymptomView(context: self.context)) {
                            Text("Add")
                        }
                )
            } // NavigationView
                .tabItem {
                    if selectedView == 0 {
                        Image(systemName: "bandage.fill")
                        Text("Symptoms")
                    }
                    else {
                        Image(systemName: "bandage")
                        Text("Symptoms")
                    }
            }.tag(0)
            
            
            Text("SecondView")
                .tabItem {
                    Image(systemName: "waveform.path.ecg")
                    Text("Statistics")
            }.tag(1)
            
        } // Tab View
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

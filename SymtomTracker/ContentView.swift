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
    
    var body: some View {
        
        TabView {
            
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
                    Image(systemName: "1.circle")
                    Text("Symptoms")
            }.tag(0)
            
            
            Text("SecondView")
                .tabItem {
                    Image(systemName: "2.circle")
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

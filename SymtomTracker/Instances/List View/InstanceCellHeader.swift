//
//  InstanceCellHeader.swift
//  SymtomTracker
//
//  Created by Brent Michalski on 3/17/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import Combine

class SortArrow: ObservableObject {
    static let shared = SortArrow()
    
    @Published var ascending = false
    
    var symbol: String {
        get {
            if ascending {
                return "↓"
            }
            else {
                return "↑"
            }
        }
    }
    
    private init() { }
}


struct InstanceCellHeader: View {
    
    @ObservedObject var sortArrow = SortArrow.shared
    
    var body: some View {
        
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Text("\(self.sortArrow.symbol) Date")
                    .frame(width: ((geometry.size.width - 45) * 0.31 + 15), height: 25)
                    .onTapGesture {
                        self.changeSort()
                }
                
                Text("Time")
                    .frame(width: (geometry.size.width - 45) * 0.10, height: 25)
                
                Text("Severity")
                    .frame(width: (geometry.size.width - 45) * 0.25, height: 25)
                
                Text("Notes")
                    .frame(width: (geometry.size.width - 45) * 0.13, height: 25)
                
                Text("Triggers")
                    .frame(width: (geometry.size.width - 45) * 0.21, height: 25)
                
                Text("")
                    .frame(width: 30, height: 25)
            }
            .frame(maxHeight: 25)
            .font(.caption)
            .background(Color.gray.opacity(0.25))
            
            Spacer()
        }
        .frame(maxHeight: 25)
    }
    
    
    func changeSort() {
        sortArrow.ascending.toggle()
    }
    
}


struct InstanceCellHeader_Previews: PreviewProvider {
    static var previews: some View {
        InstanceCellHeader()
    }
}

//
//  InstanceCell.swift
//  PhantomSmellTracker
//
//  Created by Michalski (US), James B on 2/24/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct InstanceCell: View {
    var instance: Instance
    
    var body: some View {
        HStack(alignment: .center) {
            
            HStack(alignment: .center) {
                Text(instance.stringDate)
                    .font(.headline)
                Text(instance.stringTime)
                    .font(.footnote)
            }
            
            Spacer()
            
            Text(instance.wrappedSeverity)
                .font(.caption)
            
            Spacer()
            instance.hasNote ? instance.noteImage.foregroundColor(.gray) : instance.noteImage.foregroundColor(.clear)
            Spacer()
            instance.hasTrigger ? instance.triggerImage.foregroundColor(.gray) : instance.triggerImage.foregroundColor(.clear)
        }
        .padding([.leading, .trailing])
    }
    
}



struct InstanceCellHeader: View {
    var body: some View {
        
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Text("Date")
                    .frame(width: geometry.size.width * 0.31, height: 25)
                
                Text("Time")
                    .frame(width: geometry.size.width * 0.12, height: 25)
                
                Text("Severity")
                    .frame(width: geometry.size.width * 0.24, height: 25)
                
                Text("Notes")
                    .frame(width: geometry.size.width * 0.12, height: 25)
                
                Text("Trigger")
                    .frame(width: geometry.size.width * 0.21, height: 25)
            }
            .frame(maxHeight: 25)
            .font(.caption)
            .background(Color.gray.opacity(0.25))
            
            Spacer()
        }
        .frame(maxHeight: 25)
    }
    
}

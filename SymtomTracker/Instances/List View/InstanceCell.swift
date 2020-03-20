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
        GeometryReader { geometry in
            HStack(spacing: 0) {
                
                Text(self.instance.stringDate)
                    .font(.headline)
                    .frame(width: geometry.size.width * 0.31, height: 25)
                Text(self.instance.stringTime)
                    .font(.footnote)
                    .frame(width: geometry.size.width * 0.12, height: 25)
                
                Text(self.instance.wrappedSeverity)
                    .font(.caption)
                    .frame(width: geometry.size.width * 0.24, height: 25)
                
                self.instance.hasNote ? self.instance.noteImage.foregroundColor(.gray).frame(width: geometry.size.width * 0.12, height: 25) : self.instance.noteImage.foregroundColor(.clear).frame(width: geometry.size.width * 0.12, height: 25)
                
                self.instance.hasTrigger ?
                    self.instance.triggerImage.foregroundColor(.gray).frame(width: geometry.size.width * 0.21, height: 25)
                    :
                    self.instance.triggerImage.foregroundColor(.clear).frame(width: geometry.size.width * 0.21, height: 25)
            }
            
            Spacer()
        }
    }
    
}





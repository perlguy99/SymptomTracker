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
                
//                HStack(alignment: .center) {
                    Text(self.instance.stringDate)
                        .font(.headline)
                    .frame(width: geometry.size.width * 0.31, height: 25)
                    Text(self.instance.stringTime)
                        .font(.footnote)
                    .frame(width: geometry.size.width * 0.12, height: 25)
//                }
                
//                Spacer()
                
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
//            .padding([.leading, .trailing])
        }
    }
    
}



struct InstanceCellHeader: View {
    var body: some View {
        
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Text("Date")
                    .frame(width: ((geometry.size.width - 45) * 0.31 + 15), height: 25)
                
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
    
}


//struct InstanceCell: View {
//    var instance: Instance
//
//    var body: some View {
//        GeometryReader { geometry in
//            HStack(alignment: .center) {
//
//                HStack(alignment: .center) {
//                    Text(self.instance.stringDate)
//                        .font(.headline)
//                    Text(self.instance.stringTime)
//                        .font(.footnote)
//                }
//
//                Spacer()
//
//                Text(self.instance.wrappedSeverity)
//                    .font(.caption)
//                    .frame(alignment: .leading)
//                    .background(Color.green)
//
//                Spacer()
//                self.instance.hasNote ? self.instance.noteImage.foregroundColor(.gray) : self.instance.noteImage.foregroundColor(.clear)
//                Spacer()
//                self.instance.hasTrigger ? self.instance.triggerImage.foregroundColor(.gray) : self.instance.triggerImage.foregroundColor(.clear)
//            }
//            .padding([.leading, .trailing])
//        }
//    }
//
//}

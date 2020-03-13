//
//  TriggerCell.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/12/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct TriggerCell: View {
    var triggers: [Trigger]
    
    var body: some View {
        
        HStack {
            ForEach(triggers) { trigger in
                Text(trigger.wrappedName)
                .modifier(TagText())
            }
        }
    }
}

//struct TriggerCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TriggerCell()
//    }
//}

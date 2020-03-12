//
//  MultipleSelectionRow.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/12/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

//struct MultipleSelectionRow_Previews: PreviewProvider {
//    static var previews: some View {
//        MultipleSelectionRow()
//    }
//}

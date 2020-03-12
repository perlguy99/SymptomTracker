//
//  MultipleSelectionList.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/12/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import Combine

final class SelectedTriggers: ObservableObject {
    @Published var triggers = [Trigger]()
}

struct MultipleSelectionList: View {
//    @Published var selections: [Trigger] = []
    @State var selections: [Trigger] = []
    
//    @ObservedObject var selections2 = SelectedTriggers()
    @EnvironmentObject var selections2: SelectedTriggers
//    @ObservedObject var selections2: SelectedTriggers
    
    var triggers: FetchedResults<Trigger>
    
    var body: some View {
        return List {
            ForEach(Array(triggers).sorted()) { trigger in
                MultipleSelectionRow(title: trigger.wrappedName, isSelected: self.selections.contains(trigger)) {
                    if self.selections.contains(trigger) {
                        self.selections.removeAll(where: { $0 == trigger })
                        self.selections2.triggers = self.selections
                        self.selections2.objectWillChange.send()
                    }
                    else {
                        self.selections.append(trigger)
                        self.selections2.triggers = self.selections
                        self.selections2.objectWillChange.send()
                    }
                }
            }
        }
    }
}

//struct MultipleSelectionList_Previews: PreviewProvider {
//    static var previews: some View {
//        MultipleSelectionList()
//    }
//}

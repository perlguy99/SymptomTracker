//
//  MultipleSelectionList.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/12/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI

protocol MultiSelectable: Hashable, Comparable {
    var title: String { get }
}

struct MultipleSelectionList2<T: MultiSelectable>: View {
    
    @State var selections: [T] = []

    var selectedItems: SelectedItems<T>
    var items: [T]
    
    var body: some View {
        return List {
            ForEach(items.sorted(), id: \.self) { item in
                MultipleSelectionRow(title: item.title, isSelected: self.selections.contains(item) ) {
                    if self.selections.contains(item) {
                        self.selections.removeAll(where: { $0 == item })
                        self.selectedItems.items = self.selections
                    }
                    else {
                        self.selections.append(item)
                        self.selectedItems.items = self.selections
                    }
                }
            }
            .onAppear(perform: {
                self.selections = self.selectedItems.items
            })
        }
    }
}


struct MultipleSelectionList: View {
    @State var selections: [Trigger] = []

    var selectedTriggers: SelectedItems<Trigger>
    var triggers: FetchedResults<Trigger>
    
    var body: some View {
        return List {
            ForEach(Array(triggers).sorted()) { trigger in
                MultipleSelectionRow(title: trigger.wrappedName, isSelected: self.selections.contains(trigger) ) {
                    if self.selections.contains(trigger) {
                        self.selections.removeAll(where: { $0 == trigger })
                        self.selectedTriggers.items = self.selections
                    }
                    else {
                        self.selections.append(trigger)
                        self.selectedTriggers.items = self.selections
                    }
                }
            }
            .onAppear(perform: {
                self.selections = self.selectedTriggers.items
            })
        }
    }
}

//struct MultipleSelectionList_Previews: PreviewProvider {
//    static var previews: some View {
//        MultipleSelectionList()
//    }
//}

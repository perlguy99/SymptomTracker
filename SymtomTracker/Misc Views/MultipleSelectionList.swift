//
//  MultipleSelectionList.swift
//  SymtomTracker
//
//  Created by Michalski (US), James B on 3/12/20.
//  Copyright © 2020 Perlguy, Inc. All rights reserved.
//

import SwiftUI
import CoreData

protocol MultiSelectable: Hashable, Comparable, NSFetchRequestResult {
    var title: String { get }
}

struct MultipleSelectionList<T: MultiSelectable>: View {
    @State var selections: [T] = []

    var selectedItems: SelectedItems<T>
    var items: FetchedResults<T>
    
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


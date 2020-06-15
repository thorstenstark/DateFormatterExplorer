//
//  MultipleSelectionList.swift
//  DateFormatterExplorer
//
//  Created by Thorsten Stark on 23.02.20.
//  Copyright © 2020 Thorsten Stark. All rights reserved.
//

import SwiftUI

struct MultipleSelectionList<T: Hashable>: View {
    enum RowStyle {
        case checkmark
        case toggle
    }

    @State var items: [T]
    @State var selections: Set<T> = []
    var style: RowStyle = .checkmark

    var body: some View {
        List {
            ForEach(self.items, id: \.self) { item in
//                if self.style == .checkmark {
                    MultipleSelectionRow(title: String(describing: item), isSelected: self.selections.contains(item)) {
                        if self.selections.contains(item) {
                            self.selections.remove(item)
                        } else {
                            self.selections.insert(item)
                        }
                    }
//                } else {
//                    MultipleSelectionRowCheckbox(title: String(describing: item), isSelected: self.selections.contains(item)) {
//                        if self.selections.contains(item) {
//                            self.selections.remove(item)
//                        } else {
//                            self.selections.insert(item)
//                        }
//                    }
//                }
            }
        }
    }
}



struct MultipleSelectionRowCheckbox: View {
    var title: String
    @State var isSelected: Bool {
        didSet {
            action()
        }
    }
    var action: () -> Void

    var body: some View {
        Toggle(isOn: $isSelected) { Text(String(describing: self.title)) }
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(String(describing: self.title))
                if self.isSelected {
                    Spacer()
                    Text("✓")
                }
            }
        }
    }
}

struct MultipleSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MultipleSelectionRow(title: ".hour", isSelected: false) {
            //
        }
            MultipleSelectionRow(title: "year", isSelected: true) {
                //
            }
        }
    }
}

struct MultipleSelectionRowCheckbox_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MultipleSelectionRowCheckbox(title: ".hour", isSelected: false) {
                //
            }
            MultipleSelectionRowCheckbox(title: "year", isSelected: true) {
                //
            }
        }
    }
}

struct MultipleSelectionList_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionList(items: ["a", "boo", "cebra", "dog"], style: .checkmark)
    }
}


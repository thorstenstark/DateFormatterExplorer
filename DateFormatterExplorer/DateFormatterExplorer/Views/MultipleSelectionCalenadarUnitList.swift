//
//  MultipleSelectionCalenadarUnitList.swift
//  DateFormatterExplorer
//
//  Created by Thorsten Stark on 15.06.20.
//  Copyright © 2020 Thorsten Stark. All rights reserved.
//

import Foundation
import SwiftUI

struct MultipleSelectionCalendarUnitList: View {
    @State private var items: [NSCalendar.Unit] = [.year, .month, .weekOfMonth, .day, .hour, .minute, .second]
    @State private var selectedUnits: NSCalendar.Unit = [] {
        didSet {
            guard selectedUnits != oldValue else { return }
            DispatchQueue.main.async {
                self.selectionChanged?(self.selectedUnits)
            }
        }
    }
    var selectionChanged: ((NSCalendar.Unit) -> Void)?

    var body: some View {
        List {
            ForEach(self.items, id: \.self) { item in
                MultipleSelectionRow(title: item.title, isSelected: self.selectedUnits.contains(item)) {
                    if self.selectedUnits.contains(item) {
                        self.selectedUnits.remove(item)
                    } else {
                        self.selectedUnits.insert(item)
                    }
                }
            }
        }
    }
}

extension NSCalendar.Unit: Hashable {
    var title: String {
        switch self {
        case .era: return ".era"
        case .year: return ".year"
        case .month: return ".month"
        case .day: return ".day"
        case .hour: return ".hour"
        case .minute: return ".minute"
        case .second: return ".second"
        case .weekOfMonth: return "weekofMonth"

        default:
            return String(describing: self)

        }
    }
}

struct MultipleSelectionCalendarUnitList_Preview: PreviewProvider {
    static var previews: some View {
        MultipleSelectionCalendarUnitList()
    }
}


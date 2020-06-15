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
    @State private var items: [NSCalendar.Unit] = [.era, .year, .month, .weekday, .weekdayOrdinal, .day, .hour, .minute, .second]
    @State private var selectedUnits: NSCalendar.Unit = []
    var selectionChanged: ((NSCalendar.Unit) -> Void)?

    var body: some View {
        List {
            ForEach(self.items, id: \.self) { item in
                MultipleSelectionRowCheckbox(title: item.title, isSelected: self.selectedUnits.contains(item)) {
                    if self.selectedUnits.contains(item) {
                        self.selectedUnits.remove(item)
                    } else {
                        self.selectedUnits.insert(item)
                    }
                    self.selectionChanged?(self.selectedUnits)
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
        case .weekday: return ".weekday"
        case .weekdayOrdinal: return ".weekdayOrdinal"

        default:
            return String(describing: self)

        }
    }
}

struct MultipleSelectionCalendarUnitList_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionCalendarUnitList()
    }
}


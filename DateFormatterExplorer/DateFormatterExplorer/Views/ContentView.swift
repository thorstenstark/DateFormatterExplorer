//
//  ContentView.swift
//  DateFormatterExplorer
//
//  Created by Thorsten Stark on 14.02.20.
//  Copyright © 2020 Thorsten Stark. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var firstDate: Date
    @State var showApproimation: Bool = false
    @State var showTimeRemainingPhrase: Bool = false
    @State var unitSyleIndex: Int = 0
    @State var allowedUnits: NSCalendar.Unit = [.hour]
    var formatter: DateComponentsFormatter {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = allowedUnits
        formatter.unitsStyle = DateComponentsFormatter.UnitsStyle.all[unitSyleIndex]
        formatter.includesApproximationPhrase = showApproimation
        formatter.includesTimeRemainingPhrase = showTimeRemainingPhrase
        return formatter
    }
    var body: some View {
        VStack(){
            Text("DateComponentsFormatter").bold()
            Spacer()
            Form {
                Section(header: Text("Reference Date")) {
                    DatePicker(selection: Binding<Date>(
                        get: { self.firstDate },
                        set: { self.firstDate = $0 }
                    ), displayedComponents: .date) {
                        Text("Date")
                    }
                    DatePicker(selection: Binding<Date>(
                        get: { self.firstDate },
                        set: { self.firstDate = $0 }
                    ), displayedComponents: .hourAndMinute) {
                        Text("Time")
                    }
                }
                Section(header: Text("Calendar.Units.List.title")) {
                    MultipleSelectionCalendarUnitList() { (newUnits) in
                    self.allowedUnits = newUnits
                        print("### \(newUnits)")
                }
            }
            Section {
                Toggle(isOn: $showApproimation) { Text("includesApproximationPhrase")
                }
                Toggle(isOn: $showTimeRemainingPhrase) { Text("includesTimeRemainingPhrase")
                }
            }
            Picker("Units Style", selection: $unitSyleIndex) {
                ForEach(0..<DateComponentsFormatter.UnitsStyle.all.count) { i in
                    Text(DateComponentsFormatter.UnitsStyle.all[i].name)
                }
            }
        }
            Spacer()
            Text("\(formatter.string(from: firstDate, to: Date()) ?? "-")").font(.title)
            Spacer()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(firstDate: Date(timeIntervalSinceNow: -1234567))
    }

}

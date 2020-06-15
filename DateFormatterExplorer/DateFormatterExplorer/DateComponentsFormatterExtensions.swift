//
//  DateComponentsFormatterExtensions.swift
//  DateFormatterExplorer
//
//  Created by Thorsten Stark on 23.02.20.
//  Copyright © 2020 Thorsten Stark. All rights reserved.
//

import Foundation

extension DateComponentsFormatter.UnitsStyle {
    static let all: [DateComponentsFormatter.UnitsStyle] = [.positional, .abbreviated, .short, .full, .spellOut, .brief]

    var name: String {
        switch self {
        case .positional:
            return "positional"
        case .abbreviated:
            return "abbreviated"
        case .short:
            return "short"
        case .full:
            return "full"
        case .spellOut:
            return "spellOut"
        case .brief:
            return "brief"
        @unknown default:
            return "unknown"
        }
    }

    init?(name: String) {
        switch name {
        case "positional":
            self = .positional
        case "abbreviated":
            self = .abbreviated
        case "short":
            self = .short
        case "full":
            self = .full
        case "spellOut":
            self = .spellOut
        case "brief":
            self = .brief
        default:
            return nil
        }
    }

}

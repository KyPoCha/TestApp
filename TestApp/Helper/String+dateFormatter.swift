//
//  String+dateFormatter.swift
//  TestApp
//
//  Created by Kyrylo Polishchuk on 09.01.2025.
//

import Foundation

public extension String {
    func dateFormatter() -> String {
        var isoDate = self
        if !isoDate.hasSuffix("Z") {
            isoDate += "Z"
        }

        let formatter = ISO8601DateFormatter()

        guard let date = formatter.date(from: isoDate) else {
            return ""
        }

        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .long
        displayFormatter.timeStyle = .short

        return displayFormatter.string(from: date)
    }
}

//
//  StringFormatter.swift
//  NCCommon
//
//  Created by Chinh Phung on 9/21/21.
//

public enum StringFormatter {
    public static func format(_ int: Int) -> String? {
        return format(int as NSNumber)
    }

    public static func format(_ uint: UInt) -> String? {
        return format(uint as NSNumber)
    }

    public static func format(_ float: Float) -> String? {
        return format(float as NSNumber)
    }

    public static func format(_ double: Double, maximumFractionDigits: Int = 2) -> String? {
        return format(double as NSNumber, maximumFractionDigits: maximumFractionDigits)
    }

    public static func format(_ cgFloat: CGFloat) -> String? {
        return format(cgFloat as NSNumber)
    }

    public static func format(_ number: NSNumber, maximumFractionDigits: Int = 3) -> String? {
        let formatter: NumberFormatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US")
        formatter.generatesDecimalNumbers = true
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = maximumFractionDigits
        let formatted = formatter.string(from: number)
        return formatted
    }
}


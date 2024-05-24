//
//  String+Extension.swift
//  NCCommon
//
//  Created by Chinh Phung on 9/19/21.
//

import UIKit

extension String {

    public func boundingHeight(withConstrainedWidth width: CGFloat,
                               font: UIFont,
                               lineHeight: CGFloat = 0,
                               additionalOptions: NSStringDrawingOptions = []) -> CGFloat {

        let size = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        var options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        options = options.union(additionalOptions)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight > font.lineHeight ? (lineHeight - font.lineHeight) / 2 : 0
        
        let boundingBox = self.boundingRect(
            with: size,
            options: options,
            attributes: [.font: font, .paragraphStyle: paragraphStyle],
            context: nil
        )
        return boundingBox.height
    }

    public func boundingWidth(withConstrainedHeight height: CGFloat,
                              font: UIFont,
                              additionalOptions: NSStringDrawingOptions = []) -> CGFloat {

        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: height)
        var options: NSStringDrawingOptions = [.usesFontLeading, .usesLineFragmentOrigin]
        options = options.union(additionalOptions)
        let boundingBox = self.boundingRect(
            with: size,
            options: options,
            attributes: [.font: font],
            context: nil
        )
        return boundingBox.width
    }

    public func boundingHeight(withFont font: UIFont) -> CGFloat {
        return boundingHeight(withConstrainedWidth: CGFloat.greatestFiniteMagnitude, font: font)
    }

    public func boundingWidth(withFont font: UIFont) -> CGFloat {
        return boundingWidth(withConstrainedHeight: CGFloat.greatestFiniteMagnitude, font: font)
    }
}

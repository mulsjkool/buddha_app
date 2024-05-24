//
//  UIView+Extension.swift
//  NCCommon
//
//  Created by Chinh Phung on 10/1/21.
//

import UIKit

public enum DSShadowStyle {
    case none, shadow1, shadow2, shadow3, shadow4, shadow5, shadow6
}

public protocol ShadowStyle {
    var color: CGColor { get }
    var offset: CGSize { get }
    var opacity: Float { get }
    var radius: CGFloat { get }
}

public struct ShadowStyleModel {
    let color: CGColor
    let offset: CGSize
    let opacity: Float
    let radius: CGFloat
    
    public init(color: CGColor, offset: CGSize, opacity: Float, radius: CGFloat) {
        self.color = color
        self.offset = offset
        self.opacity = opacity
        self.radius = radius
    }
}

extension UIView {

    public func setShadowStyle(_ shadowStyle: DSShadowStyle, path: UIBezierPath? = nil) {
        let style = shadowStyle.style
        layer.shadowColor = style.color
        if let path = path {
            layer.shadowPath = path.cgPath
        }
        layer.shadowOffset = style.offset
        layer.shadowOpacity = style.opacity
        layer.shadowRadius = style.radius / UIScreen.main.scale
    }
    
    public func setShadow(_ style: ShadowStyleModel) {
        layer.shadowColor = style.color
        layer.shadowOffset = style.offset
        layer.shadowOpacity = style.opacity
        layer.shadowRadius = style.radius / UIScreen.main.scale
    }
}

extension DSShadowStyle {
    var style: ShadowStyle {
        switch self {
        case .none: return Shadow.None()
        case .shadow1: return Shadow.Shadow1()
        case .shadow2: return Shadow.Shadow2()
        case .shadow3: return Shadow.Shadow3()
        case .shadow4: return Shadow.Shadow4()
        case .shadow5: return Shadow.Shadow5()
        case .shadow6: return Shadow.Shadow6()
        }
    }
}

enum Shadow {

    struct None: ShadowStyle {
        let color: CGColor = UIColor.clear.cgColor
        let offset: CGSize = .zero
        let opacity: Float = 0.0
        let radius: CGFloat = 0.0
    }

    struct Shadow1: ShadowStyle {
        let color: CGColor = UIColor(red: 0.01, green: 0.12, blue: 0.17, alpha: 0.1).cgColor
        let offset: CGSize = CGSize(width: 0.0, height: 2.0)
        let opacity: Float = 1.0
        let radius: CGFloat = 3.0
    }
    
    struct Shadow2: ShadowStyle {
        let color: CGColor = UIColor(red: 0.01, green: 0.12, blue: 0.17, alpha: 0.07).cgColor
        let offset: CGSize = CGSize(width: 0.0, height: 0.0)
        let opacity: Float = 1.0
        let radius: CGFloat = 5.0
    }
    
    struct Shadow3: ShadowStyle {
        let color: CGColor = UIColor(red: 0.01, green: 0.12, blue: 0.17, alpha: 0.08).cgColor
        let offset: CGSize = CGSize(width: 0.0, height: 6.0)
        let opacity: Float = 1.0
        let radius: CGFloat = 30
    }
    
    struct Shadow4: ShadowStyle {
        let color: CGColor = UIColor(red: 0.01, green: 0.12, blue: 0.17, alpha: 0.12).cgColor
        let offset: CGSize = CGSize(width: 0.0, height: 8.0)
        let opacity: Float = 1.0
        let radius: CGFloat = 10
    }
    
    struct Shadow5: ShadowStyle {
        let color: CGColor = UIColor(red: 0.01, green: 0.12, blue: 0.17, alpha: 0.2).cgColor
        let offset: CGSize = CGSize(width: 0.0, height: 16)
        let opacity: Float = 1.0
        let radius: CGFloat = 24
    }
    
    struct Shadow6: ShadowStyle {
        let color: CGColor = UIColor(red: 0.012, green: 0.122, blue: 0.169, alpha: 0.02).cgColor
        let offset: CGSize = CGSize(width: 0.0, height: 16.0)
        let opacity: Float = 1.0
        let radius: CGFloat = 24
    }
}

// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit.NSColor
  internal typealias Color = NSColor
#elseif os(iOS) || os(tvOS) || os(watchOS)
  import UIKit.UIColor
  internal typealias Color = UIColor
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Colors

// swiftlint:disable identifier_name line_length type_body_length
internal struct ColorName {
  internal let rgbaValue: UInt32
  internal var color: Color { return Color(named: self) }

  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a66800"></span>
  /// Alpha: 100% <br/> (0xa66800ff)
  internal static let beeswaxDark = ColorName(rgbaValue: 0xa66800ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fdd95c"></span>
  /// Alpha: 100% <br/> (0xfdd95cff)
  internal static let beeswaxLight = ColorName(rgbaValue: 0xfdd95cff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#fdebd2"></span>
  /// Alpha: 100% <br/> (0xfdebd2ff)
  internal static let beeswaxTint = ColorName(rgbaValue: 0xfdebd2ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#dedede"></span>
  /// Alpha: 100% <br/> (0xdededeff)
  internal static let borderGray = ColorName(rgbaValue: 0xdededeff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#595959"></span>
  /// Alpha: 100% <br/> (0x595959ff)
  internal static let dark = ColorName(rgbaValue: 0x595959ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#d0e2ff"></span>
  /// Alpha: 100% <br/> (0xd0e2ffff)
  internal static let denimTint = ColorName(rgbaValue: 0xd0e2ffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#e8daff"></span>
  /// Alpha: 100% <br/> (0xe8daffff)
  internal static let lavenderTint = ColorName(rgbaValue: 0xe8daffff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#945505"></span>
  /// Alpha: 100% <br/> (0x945505ff)
  internal static let lightBrown = ColorName(rgbaValue: 0x945505ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#f5f5f5"></span>
  /// Alpha: 100% <br/> (0xf5f5f5ff)
  internal static let lightGray = ColorName(rgbaValue: 0xf5f5f5ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#eaeaea"></span>
  /// Alpha: 100% <br/> (0xeaeaeaff)
  internal static let midGray = ColorName(rgbaValue: 0xeaeaeaff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#cf4018"></span>
  /// Alpha: 100% <br/> (0xcf4018ff)
  internal static let orangeDark = ColorName(rgbaValue: 0xcf4018ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#031f2b"></span>
  /// Alpha: 100% <br/> (0x031f2bff)
  internal static let primary = ColorName(rgbaValue: 0x031f2bff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#757575"></span>
  /// Alpha: 100% <br/> (0x757575ff)
  internal static let primarySlightGray = ColorName(rgbaValue: 0x757575ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#cf4018"></span>
  /// Alpha: 100% <br/> (0xcf4018ff)
  internal static let red = ColorName(rgbaValue: 0xcf4018ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#ffd7d9"></span>
  /// Alpha: 100% <br/> (0xffd7d9ff)
  internal static let redTint = ColorName(rgbaValue: 0xffd7d9ff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#a7f0ba"></span>
  /// Alpha: 100% <br/> (0xa7f0baff)
  internal static let slime = ColorName(rgbaValue: 0xa7f0baff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#1c652d"></span>
  /// Alpha: 100% <br/> (0x1c652dff)
  internal static let slimeDark = ColorName(rgbaValue: 0x1c652dff)
  /// <span style="display:block;width:3em;height:2em;border:1px solid black;background:#222222"></span>
  /// Alpha: 100% <br/> (0x222222ff)
  internal static let textBlack = ColorName(rgbaValue: 0x222222ff)
}
// swiftlint:enable identifier_name line_length type_body_length

// MARK: - Implementation Details

internal extension Color {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map { CGFloat($0 & 0xff) }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

internal extension Color {
  convenience init(named color: ColorName) {
    self.init(rgbaValue: color.rgbaValue)
  }
}

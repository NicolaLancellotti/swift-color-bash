import Foundation

public enum FontColor: Int {
  case black = 30, red, green, yellow, blue, magenta, cyan, white
}

public struct FontStyle : OptionSet {
  public let rawValue : Int
  public static let bold = FontStyle(rawValue: 1 << 0)
  public static let italic = FontStyle(rawValue: 1 << 1)
  public static let underline = FontStyle(rawValue: 1 << 2)
  
  public init(rawValue: Int) {
    self.rawValue = rawValue
  }
}

public func prettyPrint(_ items: Any..., separator: String = " ",
                        terminator: String = "\n",
                        color: FontColor = .white,
                        style: FontStyle = []) {
  
  var prettyStyle = "0"
  if style.rawValue != 0 {
    if style.contains(FontStyle.bold) {
      prettyStyle += ";1"
    }
    if style.contains(FontStyle.italic) {
      prettyStyle += ";3"
    }
    if style.contains(FontStyle.underline) {
      prettyStyle += ";4"
    }
  }
  
  let prettyColor = ";\(color.rawValue)"
  
  var prettyString = ""
  for (index, value) in items.enumerated() {
    prettyString += (index == 0 ? "": separator) + "\(value)"
  }
  
  print("\u{1B}[\(prettyStyle)\(prettyColor)m\(prettyString)\(terminator)\u{1B}[0;39m",
        separator: "", terminator: "")
}

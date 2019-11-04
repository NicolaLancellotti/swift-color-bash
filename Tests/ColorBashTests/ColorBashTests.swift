import XCTest
@testable import ColorBash

final class ColorBashTests: XCTestCase {
  
  func testColorAndStyle() {
    print()
    prettyPrint("I", terminator: " ", color: .blue, style: [.bold])
    prettyPrint("am", terminator: " ", color: .yellow, style: [.italic])
    prettyPrint("Nicola", terminator: "", color: .green, style: [.underline])
    print(" ", terminator: "")
    prettyPrint("Lancellotti", color: .red, style: [.bold, .italic, .underline])
    print()
  }
  
  func testSeparatorAndTerminantor() {
    print()
    print("Hello", "world!", separator: "-", terminator: "*\n")
    prettyPrint("Hello", "world!", separator: "-",terminator: "*\n", color: .blue, style: [.bold, .underline])
    print()
  }
  
  func testShowAllColorsAndStyles()  {
    print()
    for styleRawValue in 0...7 {
      let style = FontStyle(rawValue: styleRawValue)
      var styleString = ""
      
      if style.rawValue != 0 {
        if style.contains(FontStyle.bold) {
          styleString += " Bold"
        }
        if style.contains(FontStyle.italic) {
          styleString += " italic"
        }
        if style.contains(FontStyle.underline) {
          styleString += " Underline"
        }
      } else {
        styleString = " Regular"
      }
      
      for color in FontColor.black.rawValue...FontColor.white.rawValue {
        prettyPrint("Ciao", terminator: " ", color: FontColor(rawValue: color)!, style: style)
      }
      print(styleString)
      print()
    }
  }
  
  
  static var allTests : [(String, (ColorBashTests) -> () throws -> Void)] {
    return [
      ("Test Color and Style", testColorAndStyle),
      ("Test Separator and Terminantor", testSeparatorAndTerminantor),
      ("Test Show all Colors and Styles", testShowAllColorsAndStyles),
    ]
  }
}

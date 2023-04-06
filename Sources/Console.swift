let backgroundOffset = 10
enum Colors : Int {
    case Default = 0
    case Black = 30
    case Red = 31
    case Green = 32
    case Yellow = 33
    case Blue = 34
    case Magenta = 35
    case Cyan = 36
    case DarkGray = 90
    case LightGray = 37
    case LightRed = 91
    case LightGreen = 92
    case LightYellow = 93
    case LightBlue = 94
    case LightMagenta = 95
    case LightCyan = 96
    case White = 97
}

enum Modifiers : Int {
    case Bold = 1
    case Underline = 4
    case NoUnderline = 24
}

func applyColor(_ text: String, _ foreground : Colors) -> String {
    return "\u{001b}[\(foreground.rawValue)m\(text)\u{001b}[\(Colors.Default.rawValue)m"
}

func applyModifier(text: String, modifier : Modifiers) -> String {
    return "\u{001b}[\(modifier.rawValue)m\(text)\u{001b}[\(Colors.Default.rawValue)m"
}
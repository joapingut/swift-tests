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

func applyBackgrondColor(_ text: String, _ background : Colors) -> String {
    return "\u{001b}[\(background.rawValue + backgroundOffset)m\(text)\u{001b}[\(Colors.Default.rawValue)m"
}

func applyModifier(text: String, modifier : Modifiers) -> String {
    return "\u{001b}[\(modifier.rawValue)m\(text)\u{001b}[\(Colors.Default.rawValue)m"
}

protocol Decorable {
    func color(color : Colors) -> Decorable
    func background(color : Colors) -> Decorable
    func modifier(modifier : Modifiers) -> Decorable
    func toString() -> String
}
class TextDecorator : Decorable {
    let text : String
    var color : Colors?
    var background : Colors?
    var modifier : Modifiers?

    init (_ text : String) {
        self.text = text
    }
    
    func color(color : Colors) -> Decorable {
        self.color = color
        return self
    }

    func background(color : Colors) -> Decorable {
        self.background = color
        return self
    }

    func modifier(modifier : Modifiers) -> Decorable {
        self.modifier = modifier
        return self
    }

    func toString() -> String {
        var output = "\(text)\u{001b}[\(Colors.Default.rawValue)m"
        if (color != nil) {
            output = "\u{001b}[\(color!.rawValue)m\(output)"
        }
        if (background != nil) {
            output = "\u{001b}[\(background!.rawValue + backgroundOffset)m\(output)"
        }
        if (modifier != nil) {
            output = "\u{001b}[\(modifier!.rawValue)m\(output)"
        }
        return output
    }
}
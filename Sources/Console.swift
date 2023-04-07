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
class ChainedDecorator : Decorable {
    let inner : Decorable?
    let text : String?
    var color : Colors?
    var background : Bool = false
    var modifier : Modifiers?

    init (_ inner : Decorable) {
        self.inner = inner
        self.text = nil
    }

    init (_ text : String) {
        self.inner = nil
        self.text = text
    }
    
    func color(color : Colors) -> Decorable {
        self.color = color
        return ChainedDecorator(self)
    }

    func background(color : Colors) -> Decorable {
        self.color = color
        self.background = true
        return ChainedDecorator(self)
    }

    func modifier(modifier : Modifiers) -> Decorable {
        self.modifier = modifier
        return ChainedDecorator(self)
    }

    func toString() -> String {
        var output : String
        if (inner != nil) {
            output = inner!.toString()
        } else {
            output = "\(text!)\u{001b}[\(Colors.Default.rawValue)m"
        }
        if (color != nil) {
            output = "\u{001b}[\(background ? color!.rawValue + backgroundOffset : color!.rawValue)m\(output)"
        }
        if (modifier != nil) {
            output = "\u{001b}[\(modifier!.rawValue)m\(output)"
        }
        return output
    }
}
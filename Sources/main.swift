// The Swift Programming Language
// https://docs.swift.org/swift-book

if (CommandLine.arguments.count == 4) {
    assertCommand("greet", CommandLine.arguments[1])

    let name = CommandLine.arguments[2]
    let ageInString = CommandLine.arguments[3]

    guard let age = Int(ageInString) else {
        printUsage()
        fatalError("El segundo parámetro no es un número")
    }

    let persona = Person(name: name, age : age)
    sayHello(person: persona)
} else if (CommandLine.arguments.count == 2) {
    assertCommand("test", CommandLine.arguments[1])

    print("Texto de ejemplo");
    print(TextDecorator("Texto de ejemplo color rojo").color(color: Colors.Red).toString());
    print(TextDecorator("Texto de ejemplo color rojo, fondo amarillo").color(color: Colors.Red).background(color: Colors.Yellow).toString());
    print(TextDecorator("Texto de ejemplo color rojo, fondo amarillo, subrallado").color(color: Colors.Red).background(color: Colors.Yellow).modifier(modifier: Modifiers.Underline).toString());
} else {
    printUsage()
}

func printUsage() {
    print("HelloWorld uso:")
    print("\t· Saludar -> HelloWorld greet <Nombre> <Edad>")
    print("\t· Test -> HelloWorld test")
}

func assertCommand(_ expected : String, _ actual : String) {
    if (expected != actual) {
        printUsage()
        fatalError("Comando Incorrecto")
    }
}

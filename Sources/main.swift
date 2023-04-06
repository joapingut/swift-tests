// The Swift Programming Language
// https://docs.swift.org/swift-book

if CommandLine.arguments.count != 3 {
    print("Uso HelloWorld <Nombre> <Edad>")
} else {
    let name = CommandLine.arguments[1]
    let ageInString = CommandLine.arguments[2]

    guard let age = Int(ageInString) else {
        fatalError("El segundo parámetro no es un número")
    }

    let persona = Person(name: name, age : age)
    sayHello(person: persona)
}

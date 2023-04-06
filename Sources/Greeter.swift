
func sayHello(person: Person) {
    print("¡Hola, \(applyColor(person.name, Colors.Red)), tienes \(applyColor((String(person.age)), Colors.Cyan)) años!")
}

class Person {
    let name : String
    let age : Int

    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}

func sayHello(person: Person) {
    print("¡Hola, \(person.name), tienes \(person.age) años!")
}

class Person {
    let name : String
    let age : Int

    init(name:String, age:Int) {
        self.name = name
        self.age = age
    }
}
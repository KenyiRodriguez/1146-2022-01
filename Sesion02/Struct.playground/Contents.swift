import UIKit

struct Persona {
    
    var nombre: String
    let apellido: String
    var direccion: String?
    var edad: Int8 = 18
    
    var nombreCompleto: String {
        return "\(self.nombre) \(self.apellido)"
    }
    
    var iniciales: String {
        let inombre = self.nombre.prefix(1).uppercased()
        let iapellido = self.apellido.prefix(1).uppercased()
        
        return inombre + iapellido
    }
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
    
    func goToHome() {
        let direccionSegura = self.direccion ?? "Dirección no especificada"
        print("Vamos a casa ubicada en: \(direccionSegura)")
    }
}

var persona1: Persona = Persona(nombre: "Kenyi", apellido: "Rodriguez")
var persona2 = persona1

persona1.nombre = "Juan"

persona1.nombre
persona2.nombre



struct Motor {
    
    let cilindrada: String
    let potencia: String
    
    func encender() {
        print("Motor encendido")
    }
    
    func apagar() {
        print("Motor apagado")
    }
}

struct Automovil {
    
    let motor: Motor
    
    func andar() {
        self.motor.encender()
        self.motor.apagar()
    }
}

let motor = Motor(cilindrada: "2.0T", potencia: "280HP")
let auto = Automovil(motor: motor)

auto.motor.cilindrada
auto.motor.potencia
auto.motor.apagar()
auto.motor.encender()
auto.andar()

import UIKit

protocol Humano {
    
}

protocol Persona {
    var nombre: String { get }
    var apellido: String { get }
    func saludar()
}

protocol Empleado {
    var codigoEmpleado: String { get }
}

protocol Docente {
    var especialidad: String { get set }
}


class Alumno: Persona, Humano {
    
    var nombre: String
    var apellido: String
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
    
    func saludar() {
        print("Hola soy un alumno")
    }
}

class Profesor: Persona, Empleado, Docente, Humano {

    var nombre: String
    var apellido: String
    var codigoEmpleado: String
    var especialidad: String = ""
    
    init(nombre: String, apellido: String, codigoEmpleado: String) {
        self.nombre = nombre
        self.apellido = apellido
        self.codigoEmpleado = codigoEmpleado
    }
    
    func saludar() {
        print("Hola soy el profe!!!")
    }
}


class Director: Persona, Empleado, Humano {
    
    var nombre: String
    var apellido: String
    var codigoEmpleado: String
    
    init(nombre: String, apellido: String, codigoEmpleado: String) {
        self.nombre = nombre
        self.apellido = apellido
        self.codigoEmpleado = codigoEmpleado
    }
    
    func saludar() {
        print("Hola soy el director")
    }
}


var arrayData = [Empleado]()
//arrayData.append(Alumno(nombre: "", apellido: ""))
arrayData.append(Profesor(nombre: "", apellido: "", codigoEmpleado: ""))
arrayData.append(Director(nombre: "", apellido: "", codigoEmpleado: ""))

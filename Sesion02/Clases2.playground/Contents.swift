import UIKit

class Persona {
    var nombre: String
    var apellido: String
    
    init(nombre: String, apellido: String) {
        self.nombre = nombre
        self.apellido = apellido
    }
}

class Empleado: Persona {
    var codigoEmpleado: String
    
    init(nombre: String, apellido: String, codigoEmpleado: String) {
        self.codigoEmpleado = codigoEmpleado
        super.init(nombre: nombre, apellido: apellido)
    }
}

class Alumno: Persona {
    
}

class Profesor: Empleado {
    var especialidad: String = ""
}

class Director: Empleado {

}

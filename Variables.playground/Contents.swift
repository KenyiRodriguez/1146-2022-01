import Foundation

//************* Tipos de variable **************
/*
    Variables mutables (var)
        * Son todas aquellas que pueden cambiar su valor a lo largo de todo su ciclo de vida.
 
    Variables inmutable (let)
        * Son todas aquellas que NO  pueden cambiar su valor a lo largo de todo su ciclo de vida.
        * Nacen o son creadas con valor asignado y mueren con dicho valor.
 */

var direccion = "vsdgdfg"
direccion = "fasasas"

let ubicacion = "qwertyuio"
//ubicacion = "asdfghj" esto da error


//****************** Tipos de declaración ***********************
/*
    Declaración implícita:
        * No es necesario especificar el tipo de dato de la variable.
        * Swift infiere a que tipo de dato nos referimos.
 
    Declaración explícita:
        * SI es necesario especificar el tipo de dato de la variable.
 
 */

//implícito
let igvRate = 0.18
let edad = 31

//Explícita
var igvRate2: Float = 0.18
let edad2: Int8 = 20

let sumaIGV = igvRate + Double(igvRate2)
let sumaIGV2 = Float(igvRate) + igvRate2

let nombre = "Kenyi"
let apellido = "Rodriguez"

let nombreCompleto = nombre + " " + apellido
let nombreCompleto2 = nombre + " " + apellido + " " + String(edad)
let nombreCompleto3 = "\(nombre) \(apellido) \(edad)"
let nombreCompleto4 = "Name: \(nombre) - LastName: \(apellido) - Age: \(edad)"
let nombreCompleto5 = "Name: \(nombre)\nLastName: \(apellido)\nAge: \(edad)"
print(nombreCompleto5)

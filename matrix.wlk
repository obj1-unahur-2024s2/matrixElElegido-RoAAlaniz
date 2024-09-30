object neo {
    var energia = 100
    method esElElegido() = true
    method saltar() {
        energia = energia * 0.5 //mitad energia
    }
    method vitalidad() {
        energia = energia * 0.1 //decima parte de energia
    }
}

object morfeo {
    var vitalidad = 8
    var estaCansado = false
    method esElElegido() = false
    method vitalidad() = vitalidad
    method saltar() {
        vitalidad = 0.max(vitalidad - 1)
        estaCansado = not estaCansado // estaCansado = !estaCansado
    }
    method estaCansado() = estaCansado 
}


object trinity {
    method vitalidad() = 0
    method saltar() {}
    method esElElegido() = false
}

object nave {
    //se asume que estan en la nave metiendolos en la lista
    const property pasajeros = [neo, morfeo, trinity]  //porque esa coleccion siempre va a ser la misma
    method subirA(unPasajero) {
        pasajeros.add(unPasajero)
    }
    method bajarA(unPasajero) {
        pasajeros.remove(unPasajero)
    }
    method cantidadPasajeros() = pasajeros.size()
    method pasajeroMasVitalidad() = pasajeros.max({p => p.vitalidad()}) //de esa lista, se queda con el maximo pasajeor por su vitalidad
    // valor vitalidad del pasajero con mayor vitalidad = pasajeros.max({p => p.vitalidad()}).vitalidad()
    method estaElElegido() = pasajeros.any({p => p.esElElegido()})
    method estaEquilibrada() {
        return (self.pasajeroMasVitalidad().vitalidad()) <= (self.pasajeroMenosVitalidad().vitalidad() * 2)
    }
    method pasajeroMenosVitalidad() = pasajeros.min({p =>_ p.vitalidad()})
    method chocar() {
        pasajeros.forEach({p => p.saltar()})
        pasajeros.clear()
    }
    method acelerar() {
        self.pasajerosNoElegidos().forEach({p => p.saltar()}) //cada elemento de esa lista, salta menos el elegido
    }
    method pasajerosNoElegidos() = pasajeros.filter({p => not p.esElElegido()}) 
}

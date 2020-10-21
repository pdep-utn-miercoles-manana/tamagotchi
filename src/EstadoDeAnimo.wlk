class EstadoDeAnimo {
	method estadoContento() = new Contento()
	method estadoTriste() = new Triste()
	method estadoHambriento() = hambriento
	method estadoCansado() = cansado
	
	method dormir(unTamagotchi) {
		// No hace nada	
	}
}

object hambriento inherits EstadoDeAnimo {
	
	method comer(unTamagotchi) {
		unTamagotchi.poneteContento()
	}
	
	method jugar(unTamagotchi) {
		unTamagotchi.disminuirFelicidad(4)
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		// No pasa nada
	}
	
}

class Contento inherits EstadoDeAnimo {
	
	var vecesQueJugo = 0
	
	override method estadoContento() = self
	
	method comer(unTamagotchi) {
		unTamagotchi.aumentarFelicidad(1)
	}
	
	method jugar(unTamagotchi) {
		unTamagotchi.aumentarFelicidad(2)
		vecesQueJugo ++
		if (vecesQueJugo > 2) {
			unTamagotchi.poneteHambriento()
		}
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		unTamagotchi.jugar()
		otroTamagotchi.jugar()
		otroTamagotchi.aumentarFelicidad(4)
	}
	
}

class Triste inherits EstadoDeAnimo {
	
	var tiempoDeInicio = new Date() 
	
	override method estadoTriste() = self
	
	method comer(unTamagotchi) {
		if (self.pasaronMasDeDosMinutos()) {
			unTamagotchi.poneteContento()
		}
	}
	
	method jugar(unTamagotchi) {
		unTamagotchi.poneteContento()
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		unTamagotchi.poneteContento()
		otroTamagotchi.poneteContento()
	}
	
	method pasaronMasDeDosMinutos() {
		// FIXME: Esto no anda porque no existe ese mensaje... pero sería algo así
		return new Date().minutesSince(tiempoDeInicio) > 2
		// al momento de probar deberías hardcodear que retorne `true` o `false`
	}
}

object cansado inherits EstadoDeAnimo {

	method comer(unTamagotchi) {
		unTamagotchi.disminuirFelicidad(5)
	}
	
	method jugar(unTamagotchi) {
		self.lanzarErrorNoPuedoJugar()
	}
	
	method jugarCon(unTamagotchi, otroTamagotchi) {
		self.lanzarErrorNoPuedoJugar()
	}
	
	method lanzarErrorNoPuedoJugar() {
		throw new Exception(message = "¡No molestes! no quiero jugar")
	}
	
	override method dormir(unTamagotchi) {
		unTamagotchi.poneteContento()
	}

}
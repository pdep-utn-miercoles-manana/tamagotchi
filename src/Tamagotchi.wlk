class Tamagotchi {

	var estadoDeAnimo
	var nivelDeFelicidad

	method comer() {
		estadoDeAnimo.comer(self)
	}
	
	method jugar() {
		estadoDeAnimo.jugar(self)
	}
	
	method jugarCon(otroTamagotchi) {
		estadoDeAnimo.jugarCon(self, otroTamagotchi)
	}
	
	method poneteCansado() {
		estadoDeAnimo = estadoDeAnimo.estadoCansado()
	}
	
	method poneteHambriento() {
		estadoDeAnimo = estadoDeAnimo.estadoHambriento()
	}
	
	method poneteContento() {
		estadoDeAnimo = estadoDeAnimo.estadoContento()
	}
	
	method poneteTriste() {
		estadoDeAnimo = estadoDeAnimo.estadoTriste()
	}
	
	method aumentarFelicidad(unasUnidades) {
		nivelDeFelicidad += unasUnidades
	}

	method disminuirFelicidad(unasUnidades) {
		nivelDeFelicidad -= unasUnidades
	}
}

class Gloton inherits Tamagotchi {
	
	override method comer() {
		self.aumentarFelicidad(5)
		super()
	}
	
}

class Antisocial inherits Tamagotchi {
	
	override method jugarCon(otro) {
		self.poneteTriste()
	}
	
}

class Dormilon inherits Tamagotchi {
	
	override method jugar() {
		super()
		if (nivelDeFelicidad < 10) self.poneteCansado() 
	}
	
}

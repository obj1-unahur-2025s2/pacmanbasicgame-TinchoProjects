import wollok.game.*

object pacman {
	var property image = "pacman.png"
	var property position = game.origin()
	var vidas =3

	method vidas(){
		return vidas
	}
/*
	method image() = image
*/
/*	
	method perderVida() {
		vidas = vidas -1
		position = game.origin()
	}
*/
	method juegoTerminado() = vidas == 0

	method resetPosition() {
		position = game.origin()
	}

	method chocarCon(rival) {
		// sin dudas perdí una vida
		vidas = vidas -1
		// reset de las posiciones
		self.resetPosition()
		rival.resetPosition()
		// agregamos la validación del juego terminado en pacman
		if (self.juegoTerminado()) {
			game.say(self, "Se me terminaron las vidas!!!")
			game.onTick(300, "gameEnd", { game.stop() })
		} else {
			game.say(self, "Ups! Perdí una vida")
		}
		
		
	}

	method moverHaciaArriba() {
		if(self.position().y() == game.height() -1) {
			self.position(game.at(self.position().x() , 0))
		}
		else {
		self.position(self.position().up(1))
		}
	}

	method moverHaciaAbajo() {
		if(self.position().y() == 0) {
			self.position(game.at(self.position().x() , game.height() -1))
		}
		else {
		self.position(self.position().down(1))
		}
	}

	method moverHaciaIzquierda() {
		if(self.position().x() == 0) {
			self.position(game.at(game.width() -1 , self.position().y()))
		}
		else {
		self.position(self.position().left(1))
		}
	}

	method moverHaciaDerecha() {
		if(self.position().x() == game.width() -1) {
			self.position(game.at(0 , self.position().y()))
		}
		else {
		self.position(self.position().right(1))
		}
	}
}

object cheery {
	var property image = "cheery.png"
	var property position = game.center()
}

class Rival {
	var property position = game.at(3 , 3)
	var previousPosition = position
	const numero = 1
	
	method image() = "rival" + numero.toString() + ".png"

	method acercarseA(personaje) {
		const otroPosicion = personaje.position()
		var newX = position.x() + if (otroPosicion.x() > position.x()) 1 else -1
		var newY = position.y() + if (otroPosicion.y() > position.y()) 1 else -1
		// evitamos que se posicionen fuera del tablero
		newX = newX.max(0).min(game.width() - 1)
		newY = newY.max(0).min(game.height() - 1)
		previousPosition = position
		position = game.at(newX, newY)
	}

	method resetPosition() {
		position = game.at(numero + 1 , numero + 1)
	}

	method chocarCon(otro) {
		self.resetPreviousPosition()
	}

	method resetPreviousPosition() {
		position = previousPosition
	}
/*
	method position() = game.at(numero + 1, numero + 1)
*/
}

object fantasmaRojo {
	method position() = game.at(3,3)
	method image() = "rival1.png"
}

object fantasmaAzul {
	method position() = game.at(5,6)
	method image() = "rival2.png"
}
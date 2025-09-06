import wollok.game.*

object pacman {
	var property image = "pacman.png"
	var position = game.at(15 , 5)

	method image() = image
	
	method position(nuevaPosicion) {
		position = nuevaPosicion
	}

	method position() = position

	method cambiarSkin(nuevaSkin) {
		image = nuevaSkin
	}
}

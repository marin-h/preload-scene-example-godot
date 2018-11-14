extends Node2D
# script para manejar niveles

# estas constantes las necesitamos para la compilacion
const nivelUno = "res://nivel_uno.tscn"
const nivelDos = "res://nivel_dos.tscn"
const nivelTres= "res://nivel_uno.tscn"
const nivelCuatro = "res://nivel_dos.tscn"
const niveles = [nivelUno, nivelDos, nivelTres, nivelCuatro]
const primerNivel = ""

var escenasNiveles = []
var contadorNivel = 0
var currentLevel

func _ready():
	# usamos preload para las escenas de cada nivel
	escenasNiveles.append(preload(nivelUno))
	escenasNiveles.append(preload(nivelDos))
	escenasNiveles.append(preload(nivelTres))
	escenasNiveles.append(preload(nivelCuatro))
	# esta variable guarda la instancia del nivel actual
	currentLevel = escenasNiveles[contadorNivel].instance() 
	primerNivel = currentLevel
	# lo agregamos como hijo a la escena raíz
	self.add_child(currentLevel)
	
func siguienteNivel():
	contadorNivel = contadorNivel+1
	# quitamos del arbol el nodo del nivel actual 
	self.remove_child(currentLevel)
	currentLevel.queue_free()
	# cargamos el nuevo nivel
	currentLevel = escenasNiveles[contadorNivel].instance() 
	self.add_child(currentLevel)
	
 
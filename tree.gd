extends KinematicBody2D

var full = true

func _ready():
	pass

func harvest():
	full = false
	get_node("fullsprite").hide()
	get_node("emptysprite").show()

func grow():
	full = true
	get_node("fullsprite").show()
	get_node("emptysprite").hide()


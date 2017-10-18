extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var middlemouseclicked = false
var viewport

func _ready():
	viewport = get_viewport()
	set_process_input(true)
	

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == 3:
			middlemouseclicked = event.pressed
	
	if event.type == InputEvent.MOUSE_MOTION:
		if middlemouseclicked:
			pass
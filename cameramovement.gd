extends Camera2D

var middlemouseclicked = false
var viewport

func _ready():
	viewport = get_viewport()
	set_process_input(true)
	

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == 3:
			middlemouseclicked = event.pressed
		if event.button_index == BUTTON_WHEEL_UP:
			set_zoom(get_zoom() - Vector2(0.1, 0.1))
		if event.button_index == BUTTON_WHEEL_DOWN:
			set_zoom(get_zoom() + Vector2(0.1, 0.1))
	
	if event.type == InputEvent.MOUSE_MOTION:
		if middlemouseclicked:
			set_offset( get_offset() - event.relative_pos)
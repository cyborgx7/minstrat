extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var goal = Vector2()
var movementspeed = 100
var motion = Vector2()
var active = false


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_process_input(true)
	goal = get_global_pos()

func _fixed_process(delta):
	var position = get_global_pos()
	var tomove = movementspeed*delta
	var distance = position.distance_to(goal)
	
	if distance < tomove:
		motion = move_to(goal)
	else:
		var direction = ( goal - position ).normalized()
		motion = move(tomove * direction)

func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON and active:
		if(event.button_index == 2):
			goal = Vector2(event.x,event.y)
		if(event.button_index == 1):
			deactivate()


func _on_Area2D_input_event( viewport, event, shape_idx ):
# Convert event to local coordinates
	if event.type == InputEvent.MOUSE_BUTTON:
		if event.button_index == 1:
			activate()

func activate():
	active = true
	get_node("Area2D/activesprite").show()

func deactivate():
	active = false
	get_node("Area2D/activesprite").hide()
extends KinematicBody2D

# Init screen params to center window for OS X
var screen_size = OS.get_screen_size()
var window_size = OS.get_window_size()

# Player step
const STEP = 5
# Player speed
var player_speed
# Player movement direction
var movement = Vector2()

func _ready():
	# Init screen in the center for OS X
	OS.set_window_position(screen_size*0.5 - window_size*0.5)
	# Enable user input
	set_process_input(true)
	# Enable processing
	set_fixed_process(true)

func _input(event):
	if(event.is_action_pressed("ui_left")):
		movement = Vector2(-STEP, 0)
	elif(event.is_action_pressed("ui_right")):
		movement = Vector2(STEP, 0)
	elif(event.is_action_pressed("ui_up")):
		movement = Vector2(0, -STEP)
	elif(event.is_action_pressed("ui_down")):
		movement = Vector2(0, STEP)
	else:
		movement = Vector2(0, 0)			
		
	# Consult Yoav & Aran to decide how the player should move
	# move(movement)
	
func _fixed_process(delta):
	move(movement)

	
	
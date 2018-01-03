extends KinematicBody2D

# Init screen params to center window for OS X
var screen_size = OS.get_screen_size()
var window_size = OS.get_window_size()

# Player sprite
onready var sprite = get_node("PlayerSprite")

# Player step var
const STEP = 200.0

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
	#set player movement according to button pressed
	if event.is_action_pressed("ui_right"):
		movement += Vector2(1, 0)
	elif event.is_action_released("ui_right"):
		movement -= Vector2(1, 0)
		
	elif event.is_action_pressed("ui_left"):
		movement += Vector2(-1, 0)
	elif event.is_action_released("ui_left"):
		movement -= Vector2(-1, 0)
		
	elif event.is_action_pressed("ui_up"):
		movement += Vector2(0, -1)
	elif event.is_action_released("ui_up"):
		movement -= Vector2(0, -1)
		
	elif event.is_action_pressed("ui_down"):
		movement += Vector2(0, 1)
	elif event.is_action_released("ui_down"):
		movement -= Vector2(0, 1)


func _fixed_process(delta):
	#Set sprite animation and rotation
	if(movement == Vector2(0,0)):
		sprite.set_animation("idle_knife")
	else:
		sprite.set_animation("move_knife")
		sprite.set_rot(movement.angle()-PI/2)

	# Consult Yoav & Aran to decide how the player should move
	# Old:
	# move(movement)
	# New: move_and_slide(Vector2(), normal, friction)
	
	#Act - move
	move(movement.normalized() * STEP * delta)
	
	
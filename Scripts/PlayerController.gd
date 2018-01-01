extends KinematicBody2D

# Init screen params to center window for OS X
var screen_size = OS.get_screen_size()
var window_size = OS.get_window_size()

# Player Input
var btn_right 
var btn_left 
var btn_up
var btn_down

# Player sprite
onready var image = get_node("PlayerSprite")

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

func _fixed_process(delta):
	movement = Vector2()
	btn_right = Input.is_action_pressed("ui_right")
	btn_left = Input.is_action_pressed("ui_left")
	btn_up = Input.is_action_pressed("ui_up")
	btn_down = Input.is_action_pressed("ui_down")
	
	if btn_right:
		movement += Vector2(1, 0)
		image.set_flip_h(false)
		
	if btn_left:
		movement += Vector2(-1, 0)
		image.set_flip_h(true)
		
	if btn_up:
		image.set_flip_v(true)
		movement += Vector2(0, -1)
		
	if btn_down:
		movement += Vector2(0, 1)
		image.set_flip_v(false)
		
	# Consult Yoav & Aran to decide how the player should move
	# Old:
	# move(movement)
	# New: move_and_slide(Vector2(), normal, friction)
	
	move(movement.normalized() * STEP * delta)
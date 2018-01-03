extends Control

export (PackedScene) var next_scene
onready var anim_player = get_node("AnimationPlayer")

var is_loading = true

func _ready():
	set_process_input(true)
	
	# Run the animation
	fade_in_out()
	
func fade_in_out():
	anim_player.play("fade_in_out")
	anim_player.connect("finished", self, "goto_next_scene")
	
func _input(event):
	if event.is_action_pressed("ui_select"):
		next_scene()

func goto_next_scene():
	# If game data is still loading wait in 1sec intervals
	if is_loading:
		var timer = Timer.new()
		add_child(timer)
		timer.set_wait_time(1) #seconds
		timer.set_one_shot(false) #should run once? redundent cuz this is probably default
		timer.connect("timeout", self, "next_scene")
		timer.start()
	else:
		next_scene()
		
func next_scene():
	if !is_loading:
		print("done splash")
		get_parent().add_child(next_scene.instance()) # add next scene to parent node
		queue_free() # destroy self

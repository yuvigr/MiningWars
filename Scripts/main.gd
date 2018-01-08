extends Control

export (PackedScene) var next_scene
var next_scene_instance = null

# Loading Thread
onready var loading_thread = Thread.new()


func _ready():
	# Begin loading data
	var res = loading_thread.start(self, "load_data")


	# Display splash screen
	splash_screen()
	
	# In case we want to dispose of the scene we need to wait for the thread to finish
	# loading_thread.wait_to_finish()
	# queue_free()

func splash_screen():
	# Create splash screen instance and add as child
	next_scene_instance = next_scene.instance()
	add_child(next_scene_instance)
	
	# Loads all game data (Configs, Saved games etc.)
func load_data(vars):
	
	# Proccessing data
	
	next_scene_instance.is_loading = false

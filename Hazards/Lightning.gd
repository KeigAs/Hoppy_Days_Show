extends Node2D

const SPEED = 550


func _ready():
	set_as_top_level(true)
	global_position = get_parent().global_position
	
func _process(delta):
	position.y += SPEED * delta
	collision()
	
func collision():
	var collider = $Area2D.get_overlapping_bodies()
	for object in collider:
		if object.name == "Player":
			get_tree().call_group("GameState", "hurt")
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

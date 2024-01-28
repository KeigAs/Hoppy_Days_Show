extends Node2D

var timeout = false

func _process(delta):
	if $Sprite2D/RayCast2D.is_colliding():
		fire()
		
func fire():
	if not timeout:
		$Sprite2D/RayCast2D.add_child(load("res://Hazards/Lightning.tscn").instantiate())
		$Sprite2D/Timer.start()
		timeout = true

func _on_Timer_timeout():
	timeout = false

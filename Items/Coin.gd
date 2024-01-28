extends Node2D

var taken = false

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		$AnimationPlayer.play("collect")
		$coin.play()
		get_tree().call_group("GameState", "coin_up")
	
func end_animation():
	queue_free()

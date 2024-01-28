extends Node2D



func _on_SpikeTrap_body_entered(body):
	get_tree().call_group("GameState", "hurt")




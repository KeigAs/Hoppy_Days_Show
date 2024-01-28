extends Node2D


func _ready():
	$AnimatedSprite2D.play("default")

func _on_JumpPad_body_entered(body):
	$AnimationPlayer.play("boost")
	body.boost()

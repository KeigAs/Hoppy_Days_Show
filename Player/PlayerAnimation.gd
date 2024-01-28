extends AnimatedSprite2D



func _on_Player_animate(motion):
	
	if motion.y < 0:
		play("jump")
	
	elif motion.x < -15:
		flip_h = true
		play("walk")
	
	elif motion.x > 15:
		flip_h = false
		play("walk")
	
	else:
		play("idle")

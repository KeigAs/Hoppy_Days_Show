extends CharacterBody2D

var motion = Vector2(0,0)
const SPEED = 1000
const GRAVITY = 100
const UP = Vector2(0,-1)
const JUMP_SPEED = 1800
const WORLD_LIMIT = 5000    # Outside this limit, the player dies
const JUMP_MULTIPLIER = 1.8



signal animate


func _physics_process(delta):
	set_velocity(motion)
	set_up_direction(UP)
	move_and_slide()
	apply_gravity()
	move()
	jump()
	animate()
	respawn()
	

func apply_gravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("GameState", "hurt")
		position = Vector2(2083,1509)
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = + GRAVITY
	
	else: 
		motion.y += GRAVITY
		
func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
			motion.y = -JUMP_SPEED
	
func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else: motion.x = lerp(motion.x,0,0.25)
	
func animate():
	emit_signal("animate", motion) 
	
func respawn():
	if Input.is_action_pressed("respawn"):
		position = Vector2(2083,1509)
	
	
func hurt():
	motion.y -= 3
	motion.y = -JUMP_SPEED
	$PainSFX.play()
	
	
	
func boost():
	motion.y = -JUMP_SPEED * JUMP_MULTIPLIER
	$JumpSFX.play()









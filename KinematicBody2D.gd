extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 9.80665
const SPEED = 200
const JUMP_HEIGHT = -466
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("Right"):
		motion.x = SPEED
	elif Input.is_action_pressed("Left"):
		motion.x = -SPEED
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_action_just_pressed("Up"):
			motion.y = JUMP_HEIGHT
			
	motion = move_and_slide(motion,UP)
	pass

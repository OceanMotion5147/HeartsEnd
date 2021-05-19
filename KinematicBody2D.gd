extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 9.80665
const SPEED = 100
const JUMP_HEIGHT = -200
var motion = Vector2()

func _physics_process(delta):
	motion.y += GRAVITY
	
	if Input.is_action_pressed("Right"):
		motion.x = SPEED
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("Left"):
		motion.x = -SPEED
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		motion.x = 0
		$Sprite.play("Idle")
	if is_on_floor():
		if Input.is_action_just_pressed("Up"):
			motion.y = JUMP_HEIGHT
	else:
		$Sprite.play("Jump")
			
	motion = move_and_slide(motion,UP)
	pass

extends KinematicBody2D

signal lost_life

const UP = Vector2(0, -1)
const GRAVITY = 9.80665
const MAX_SPEED = 100
const ACCELERATION = 50
const JUMP_HEIGHT = -200

var motion = Vector2()
var score

func _ready():
	set_physics_process(true)

func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	# When player presses respective button it moves the player model
		#When player presses 'D' player is moved to right
	if Input.is_action_pressed("Right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
		# When player presses 'A' player is moved to left
	elif Input.is_action_pressed("Left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
		# When player presses 'P' player performs the punch animation
	elif Input.is_action_pressed("Punch"):
		$Sprite.flip_h = true
		$Sprite.play("PunchAttack")
		# When player presses 'K' Player performs the kick animation
	elif Input.is_action_pressed("Kick"):
		$Sprite.flip_h = true
		$Sprite.play("KickAttack")
	else:
		# If player does not press anything this animation is played
		motion.x = lerp(motion.x, 0, 0.2)
		friction = true
		$Sprite.play("Idle")
		
	if is_on_floor():
		# When player presses 'SPACE' player jumps but has to be colliding with the ground in order to do so
		if Input.is_action_just_pressed("Up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		$Sprite.play("Jump")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	motion = move_and_slide(motion,UP)
	pass

# When player collides with fall zone, the level is reset and signal is emitted



func _on_fallzone_body_entered(body):
	emit_signal("lost_life")
	get_tree().change_scene("res://World.tscn")

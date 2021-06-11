extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 9.80665
const MAX_SPEED = 100
const ACCELERATION = 50
const JUMP_HEIGHT = -200
var motion = Vector2()
var score = 0

func _ready():
	set_physics_process(true)
	set_process(true)

func _process(delta):
	var LabelNode = get_parent().get_node("Score_Counter/CanvasLayer/Control/RichTextLabel")
	LabelNode.text = str(score)


func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("Right"):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_action_pressed("Left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		friction = true
		$Sprite.play("Idle")
	if is_on_floor():
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

func _on_AmmoTin_1_body_entered(body):
	score += 1

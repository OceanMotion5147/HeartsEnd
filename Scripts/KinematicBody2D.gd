extends KinematicBody2D

signal health_updated(health)
signal killed()

const UP = Vector2(0, -1)
const GRAVITY = 9.80665
const MAX_SPEED = 100
const ACCELERATION = 50
const JUMP_HEIGHT = -200

export (float) var max_health = 100

onready var health = max_health setget _set_health
onready var invulnerability_timer = $InvulnerabilityTimer

var motion = Vector2()
var score

func _ready():
	set_physics_process(true)

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
	elif Input.is_action_pressed("Punch"):
		$Sprite.flip_h = true
		$Sprite.play("PunchAttack")
	elif Input.is_action_pressed("Kick"):
		$Sprite.flip_h = true
		$Sprite.play("KickAttack")
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

func damage(amount):
	if invulnerability_timer.is_stopped():
		invulnerability_timer.start
		_set_health(health - amount)

func kill():
	get_tree().quit

func _set_health(value):
	var prev_health = health
	health = clamp(value, 0, max_health)
	if health != prev_health:
		emit_signal("health_updated", health)
		if health == 0:
			kill()


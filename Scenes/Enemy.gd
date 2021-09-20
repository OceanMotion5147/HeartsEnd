extends KinematicBody2D


var is_moving_left = true
var gravity = 10
var velocity = Vector2(0,0)
var speed = 32
var damage = 100


func _ready():
	$AnimatedSprite.play("Run")
	
func _process(_delta):
	if $AnimatedSprite.animation == "Attack":
		return
	
	move_character()
	detect_turn_around()
	
func move_character():
	velocity.x = -speed if is_moving_left else speed
	velocity.y = gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func detect_turn_around():
	if not $floor_check.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x

func hit():
	$AttackDetector.monitoring = true
	
func end_hit():
	$AttackDetector.monitoring = false
	
func start_run():
	if $AttackDetector.monitoring == false:
		$AnimatedSprite.play("Run")

func _on_PlayerDetector_body_entered(body):
	$AnimatedSprite.play("Attack")
	yield($AnimatedSprite,"animation_finished")
	$AnimatedSprite.play("Run")
	

func _on_AttackDetector_body_entered(body):
	get_tree().reload_current_scene()
	

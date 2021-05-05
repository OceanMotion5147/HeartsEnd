extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	motion.y +=10
	if Input.is_action_pressed("ui_right"):
		motion.x = 150
	elif Input.is_action_pressed("ui_left"):
		motion.x=-150
	else: 
		motion.x=0
	if Input.is_action_pressed("ui_up"):
		motion.y = -200
	move_and_slide(motion)
	pass


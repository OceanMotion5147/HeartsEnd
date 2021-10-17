extends Area2D

export(String, FILE, "*.tscn") var world_scene

# When player collides with this, the next level is loaded
func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			get_tree().change_scene(world_scene)

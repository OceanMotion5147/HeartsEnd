extends Area2D

signal ammo_collected

# when player collides with ammo tin it is removed from level
# code also emits a signal so the hud changes the score shown
func _on_AmmoTin_1_body_entered(body):
	emit_signal("ammo_collected")
	queue_free()

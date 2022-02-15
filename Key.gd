extends Area2D

signal key_collected

func _on_Key_body_entered(body):
	emit_signal("key_collected")
	set_collision_mask_bit(0, false)
	queue_free()

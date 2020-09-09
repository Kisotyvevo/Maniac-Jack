extends Area2D





func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		if get_tree().get_nodes_in_group("Player")[0].MunicionActual == 15:
			pass
		else:
			get_tree().get_nodes_in_group("Player")[0].Recogiendo_Municiones()
			queue_free()


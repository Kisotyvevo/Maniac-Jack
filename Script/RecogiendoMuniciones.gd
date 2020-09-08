extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func _ready():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.is_in_group("Player"):
		get_tree().get_nodes_in_group("Player")[0].Recogiendo_Municiones()
	pass

func Destruir():
	queue_free()

extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass





func _on_fin_body_entered(body):
	if body.is_in_group("Player"):
		$"Player/Audio del nivel".stop()
		$Player/Win.play()
		Controlador.nivel1cc()
		get_tree().change_scene("res://Escenas/FinDelJuego.tscn")


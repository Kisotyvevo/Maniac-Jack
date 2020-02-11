extends Node2D


func _ready():
	pass


func _on_Cartel_1_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 1".visible = true



func _on_Cartel_2_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 2".visible = true


func _on_Cartel_3_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 2".visible = false
		$"Carteles/Cartel 1".visible = false


func _on_Cartel_4_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 4".visible = true


func _on_Cartel_4_1_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 4".visible = false


func _on_Cartel_5_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 5".visible = true


func _on_Cartel_5_1_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 5".visible = false


func _on_Cartel_6_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 6".visible = true


func _on_Cartel_7_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 7".visible = true


func _on_Puerta_body_entered(body):
	if "Player" in body.name:
		$"Carteles/Cartel 7".visible = false
		$Puerta.visible = true
		$"Player/Audio del nivel".stop()
		$Player/Win.play()
		$"Puerta/Timer".start()

func _on_Timer_timeout():
	get_tree().change_scene("res://Escenas/Titles.tscn")

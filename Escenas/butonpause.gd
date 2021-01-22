extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
	else:
		get_tree().paused = true
		$cosa0.visible = true
		$cosa.visible = true
		$renaudar.visible = true
		$salir.visible = true


func _on_salir_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		get_tree().change_scene("res://Escenas/Titles.tscn")

func _on_renaudar_pressed():
	if get_tree().paused == true:
		get_tree().paused = false
		$cosa0.visible = false
		$cosa.visible = false
		$renaudar.visible = false
		$salir.visible = false


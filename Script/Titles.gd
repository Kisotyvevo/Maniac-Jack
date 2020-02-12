extends Node
var Mundo = "res://Escenas/Mundo.tscn"

func _ready():
	pass

func _on_Inicio_pressed():
	$"Loading".visible = true
	$Inicio.visible = false
	$Creditos.visible = false
	$MarginContainer/VBoxContainer/TextureRect.visible = false
	$Nuces/Sprite.visible = false
	$Nuces/Sprite2.visible = false
	$Nuces/Sprite3.visible = false
	$Nuces/Sprite4.visible = false
	$Nuces/Sprite5.visible = false
	$Nuces/Sprite6.visible = false
	$Timer.start()
	load(Mundo)
	

func _on_ButtonInicio_pressed():
	
	pass

func _on_Creditos_pressed():
	$Creditos2.visible = true
	$Creditos.visible = false


func _on_Atras_pressed():
	$Creditos2.visible = false
	$Creditos.visible = true

func _physics_process(delta):
	if Input.is_action_pressed("ui_select"):
		get_tree().quit()
	if Input.is_action_pressed("ui_up"):
		get_tree().change_scene("res://Escenas/Mundo.tscn")


func _on_Timer_timeout():
	get_tree().change_scene("res://Escenas/Mundo.tscn")
	pass # Replace with function body.

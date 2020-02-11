extends Node

func _ready():
	pass

func _on_Inicio_pressed():
	$"title-Inicio".visible = true
	$Creditos.visible = false
	

func _on_ButtonInicio_pressed():
	get_tree().change_scene("res://Escenas/Mundo.tscn")
	

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

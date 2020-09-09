extends Node2D
var Mundo1 = "res://Escenas/Mundo.tscn"
var Mundo2 = "res://Escenas/Mundo2.tscn"
var Mundo3 = "res://Escenas/Mundo.tscn"
var boton3bloqueado = true
func _ready():
	pass 


func _process(delta):
	desbloquearboton2()
	desbloquearboton3()
	Controlador.nivel1Complete
	Controlador.nivel2Complete
	
	



func _on_Button_pressed():
	get_tree().change_scene("res://Escenas/Mundo1.tscn")


func desbloquearboton2():
	if Controlador.nivel1Complete == true:
		$Buttonnivel2.visible = true
		$Sprite.visible = false
		
func desbloquearboton3():
	if Controlador.nivel2Complete == true:
		$Button3.visible = true
		boton3bloqueado = false
func _on_Button3_pressed():
	get_tree().change_scene("res://Escenas/Mundo 3.tscn")
func _on_volver_atras_pressed():
	get_tree().change_scene("res://Escenas/Titles.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Escenas/Mundo 2.tscn")

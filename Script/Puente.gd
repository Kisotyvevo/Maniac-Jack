extends Node

var velocidad = Vector2()
var distancia = Vector2()
var target
export (float) var tiempo_estimado = 3


func _ready():
	target = get_node("Hasta")
	distancia = target.global_position - get_node("Plataforma").global_position 
	velocidad = distancia / tiempo_estimado
	get_node("Plataforma").linear_velocity = velocidad

func _physics_process(delta):
	pass
	
func set_objetivo():
	if (target == get_node("desde")):
		target = get_node("Hasta")
	else:
		target = get_node("Desde")
		
	distancia = target.global_position - get_node("Plataforma").global_position 
	velocidad = distancia / tiempo_estimado
	get_node("Plataforma").linear_velocity = velocidad

func _on_Area2D_body_entered(body):
	if body.is_in_group("plataforma"):
		set_objetivo()
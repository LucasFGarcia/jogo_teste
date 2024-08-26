extends Area2D

@onready var player = $"../player"


func _on_body_entered(body):
	if body.name =="player":
		player._levoudano()
		print("O jogador recebeu dano")
		print("morri")
		
		

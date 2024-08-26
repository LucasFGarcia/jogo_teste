extends Area2D
@onready var player = $"../player"

func _on_body_entered(body):
	if body.name == "player":
		print("ta podi essa melancia bluh")
		$anim_itemmp.play("coletado")

		await $anim_itemmp.animation_finished
		queue_free()
		player._levoudano() 


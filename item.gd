extends Area2D
var ponto = 1

func _on_body_entered(body):
	if body.name == "player":
		Global.somaPontos += ponto
		print(Global.somaPontos)
		$anim_item.play("coletado")
		
		await $anim_item.animation_finished
		queue_free()
		



 # Replace with function body.

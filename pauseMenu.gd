extends CanvasLayer

var game_paused = false

func _ready():
	visible = false
	
	
func _on_button_pressed():
	pass 
	get_tree().quit()
	
func _on_button_2_pressed():
	pass 
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://Cenas/level;tscn")
	get_tree().reload_current_scene()
	
	
func _on_button_3_pressed():
	pass 
	get_tree().paused = false
	visible = false	
	
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		game_paused = !game_paused
		get_tree().paused = game_paused
		visible = game_paused

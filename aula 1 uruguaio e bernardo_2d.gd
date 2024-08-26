extends Node2D
@onready var player = $player
@onready var control = $Hud/Control

func _ready():
	player.morri.connect(_resetar)
	control.timeOver.connect(_resetar)
	Global.somaPontos = 0 
	
func _resetar():
	get_tree().reload_current_scene()





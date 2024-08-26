extends Control
@onready var pontos = $MarginContainer/HBoxContainer/Pontos as Label
@onready var timer_count = $MarginContainer/HBoxContainer2/timer_count as Label

@onready var timer = $timer_cont as Timer

@export_range(0,2) var min_padrao = 1
@export_range(0,59) var seg_padrao = 0
signal timeOver
var minutos = 0 
var segundos = 0 

func _ready():
	segundos = seg_padrao
	minutos = min_padrao
	pontos.text = str(Global.somaPontos)
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)

	
func _process(delta):
	pontos.text = str("%03d" % Global.somaPontos)
	if minutos == 0 && segundos == 0:
		emit_signal("timeOver")
	
	
	


func _on_timer_ready():
	pass # Replace with function body.
	pontos.text = str("%03d" % Global.pontos) 
	timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	


func _on_timer_timeout():
	if segundos == 0:
		if minutos >0:
			minutos -=1
			segundos = 60
	segundos -=1
	timer_count.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)
	print(minutos,":",segundos)

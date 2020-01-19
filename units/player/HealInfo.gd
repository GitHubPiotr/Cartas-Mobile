extends Node2D

var root_pos : Vector2
var duration

func _ready():
	duration = 0.5
	$Timer.wait_time = duration
	root_pos = position

func show_heal(value):
	$Label.text = str(value)
	$Tween.interpolate_property(self, "modulate", Color(1,1,1,1), 
		Color(1,1,1,0), duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

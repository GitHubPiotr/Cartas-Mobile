extends Node2D

var root_pos : Vector2

func _ready():
	root_pos = position

func show_damage(damage):
	$Label.text = str(damage)
	$Tween.interpolate_property(self, "position", root_pos, 
		root_pos + Vector2(15, -50), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property(self, "scale", Vector2(0, 0), 
		Vector2(1.4, 1.4), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.interpolate_property(self, "modulate", Color(1,1,1,1), 
		Color(1,1,1,0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

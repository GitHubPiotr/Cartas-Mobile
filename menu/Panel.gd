extends ColorRect

var character_clicked
var map_clicked
var upgrade_clicked
var alchemy_clicked

func _on_Character_gui_input(event):
	if event is InputEventMouseButton and \
		event.button_index == BUTTON_LEFT and event.pressed:
			character_clicked = true
			$Tween.interpolate_property($PanelLayout/Buttons/Character.get_material(), 
				"shader_param/bright_amount", 
				0, 1, 0.5, 
				Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$Tween.start()
	else: character_clicked = false

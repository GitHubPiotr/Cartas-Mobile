extends Panel

func _on_Map_gui_input(event):
	if event is InputEventMouseButton and \
		event.button_index == BUTTON_LEFT and event.pressed:
			#character_clicked = true
			$Tween.interpolate_property(self.get_material(), 
				"shader_param/bright_amount", 
				0, 1, 0.5, 
				Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$Tween.start()
	#else: character_clicked = false

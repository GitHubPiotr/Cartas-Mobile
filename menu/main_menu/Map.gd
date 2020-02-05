extends Panel

func _on_Map_gui_input(event):
	if event is InputEventMouseButton and \
		event.button_index == BUTTON_LEFT and event.pressed:
			$Tween.interpolate_property(self.get_material(), 
				"shader_param/bright_amount", 
				0, 1, 0.5, 
				Tween.TRANS_CUBIC, Tween.EASE_OUT)
			$Tween.start()

func _on_Tween_tween_all_completed():
	get_tree().change_scene("res://menu/map_menu/MapMenu.tscn")

extends GridContainer

func _on_Panel_gui_input(event, sender_id):
	if event is InputEventMouseButton and \
		event.button_index == BUTTON_LEFT and event.pressed:
			Game.GET_NODE("CharacterMenu").emit_signal("bag_slot_clicked", sender_id)

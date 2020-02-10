extends Node

func sort_items(slots_container):
	if $Items.get_child_count() == 0: return
	$Items.get_child(0).global_position = slots_container.get_node("Panel").rect_global_position
	$Slots.fill_slot(0, $Items.get_child(0))

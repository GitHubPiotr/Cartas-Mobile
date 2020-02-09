extends Node

func init(grid_panel):
	get_child(0).global_position = grid_panel.get_node("Panel").rect_global_position
	Game.GET_NODE("EQMenu").get_node("Slots").fill_slot(0, get_child(0))
	
	get_child(1).global_position = grid_panel.get_node("Panel2").rect_global_position
	Game.GET_NODE("EQMenu").get_node("Slots").fill_slot(1, get_child(1))

extends Node

func init(grid_panel):
	get_child(0).global_position = grid_panel.get_node("Panel").rect_global_position
	Game.GET_NODE("EQMenu").get_node("Slots").fill_slot(0)
	

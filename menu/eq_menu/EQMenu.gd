extends Node

signal slot_clicked

func _ready():
	Game.ADD_NODE(self)
	$Items.init($Panel/PanelLayout/VBoxContainer2/CenterContainer/GridContainer)
	connect("slot_clicked", self, "_slot_clicked")

func _slot_clicked(slot_id) -> String:
	print("::EQ_SYSTEM:: Slot ", slot_id, " clicked!")
	if $Slots.is_filled_slot(slot_id):
		print("::EQ_SYSTEM:: Slot ", slot_id, " is filled!")
		return("FILLED")
	return("EMPTY")


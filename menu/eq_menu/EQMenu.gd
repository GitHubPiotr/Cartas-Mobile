extends Node

onready var slots_container = $Panel/PanelLayout/VBoxContainer2/CenterContainer/GridContainer

var selected_slot = null
var selected_item = null

signal slot_clicked

func _ready():
	Game.ADD_NODE(self)
	$Items.init(slots_container)
	connect("slot_clicked", self, "_slot_clicked")

func _process(delta):
	if selected_item != null:
		selected_item.global_position = get_viewport().get_mouse_position() - Game.EQ_SLOT_SIZE

func _slot_clicked(slot_id):
	var item = $Slots.get_content(slot_id)
	if item != null:
		if selected_item != null: return
		selected_slot = slot_id
		selected_item = item
		$Items.move_child(selected_item, $Items.get_child_count())
		$Slots.clear_slot(selected_slot)
		print("::EQ_SYSTEM:: Got item ", item.name, " from slot ", slot_id)
	elif selected_item != null:
		selected_item.global_position = slots_container.get_child(slot_id).rect_global_position
		$Slots.fill_slot(slot_id, selected_item)
		print("::EQ_SYSTEM:: Item ", selected_item.name, " released to slot: ", slot_id)
		selected_item = null

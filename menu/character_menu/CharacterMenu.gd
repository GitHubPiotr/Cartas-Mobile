extends Node

onready var slots_container = $Panel/VBoxContainer/EQPanel/CenterContainer/GridContainer

var selected_slot = null
var selected_item = null

signal eq_slot_clicked
signal character_slot_clicked

func _ready():
	Game.ADD_NODE(self)
	$EQMenu/Items.init(slots_container)
	connect("eq_slot_clicked", self, "_eq_slot_clicked")
	connect("character_slot_clicked", self, "_character_slot_clicked")

func _process(delta):
	if selected_item != null:
		selected_item.global_position = get_viewport().get_mouse_position() - Game.EQ_SLOT_SIZE

func _eq_slot_clicked(slot_id):
	var item = $EQMenu/Slots.get_content(slot_id)
	if item != null:
		if selected_item != null: return
		selected_slot = slot_id
		selected_item = item
		selected_item.get_node("Panel").visible = true
		$EQMenu/Items.move_child(selected_item, $EQMenu/Items.get_child_count())
		$EQMenu/Slots.clear_slot(selected_slot)
		print("::EQ_SYSTEM:: Got item ", item.name, " from slot ", slot_id)
	elif selected_item != null:
		selected_item.global_position = slots_container.get_child(slot_id).rect_global_position
		$EQMenu/Slots.fill_slot(slot_id, selected_item)
		selected_item.get_node("Panel").visible = false
		print("::EQ_SYSTEM:: Item ", selected_item.name, " released to slot: ", slot_id)
		selected_item = null

func _character_slot_clicked():
	pass

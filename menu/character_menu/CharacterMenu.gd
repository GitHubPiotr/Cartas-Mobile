extends Node

onready var slots_container = $Panel/VBoxContainer/BagPanel/CenterContainer/GridContainer
onready var eq_container = $Panel/VBoxContainer/EQPanel/EQGridContainer

var selected_slot = null
var selected_item = null

var item_list

signal bag_slot_clicked
signal eq_slot_clicked

func _ready():
	Game.ADD_NODE(self)
	Game.ADD_NODE($EQMenu)
	Game.ADD_NODE($BagMenu)
	connect("bag_slot_clicked", self, "_bag_slot_clicked")
	connect("eq_slot_clicked", self, "_eq_slot_clicked")
	for item in Items.get_all_items():
		var i = item.instance()
		$BagMenu/Items.add_child(i)
	$BagMenu.sort_items(slots_container)

func _process(delta):
	if selected_item != null:
		selected_item.global_position = get_viewport().get_mouse_position() - Game.EQ_SLOT_SIZE

func _bag_slot_clicked(slot_id):
	var item = $BagMenu/Slots.get_content(slot_id)
	if item != null:
		if selected_item != null: return
		selected_slot = slot_id
		selected_item = item
		selected_item.get_node("Panel").visible = true
		$BagMenu/Items.move_child(selected_item, $BagMenu/Items.get_child_count())
		$BagMenu/Slots.clear_slot(selected_slot)
		print("::EQ_SYSTEM:: Got item ", item.name, " from slot: ", slot_id)
	elif selected_item != null:
		selected_item.global_position = slots_container.get_child(slot_id).rect_global_position
		$BagMenu/Slots.fill_slot(slot_id, selected_item)
		selected_item.get_node("Panel").visible = false
		print("::EQ_SYSTEM:: Item ", selected_item.name, " released to slot: ", slot_id)
		selected_item = null

func _eq_slot_clicked(slot_id):
	var item = $EQMenu/Slots.get_content(slot_id)
	if item != null:
		if selected_item != null: return
		selected_slot = slot_id
		selected_item = item
		selected_item.get_node("Panel").visible = true
		$EQMenu/Items.move_child(selected_item, $EQMenu/Items.get_child_count())
		$EQMenu/Slots.clear_slot(selected_slot)
		print("::EQ_SYSTEM:: Got item ", item.name, " from slot: ", slot_id)
	elif selected_item != null:
		selected_item.global_position = eq_container.get_child(slot_id).rect_global_position
		$EQMenu/Slots.fill_slot(slot_id, selected_item)
		selected_item.get_node("Panel").visible = false
		print("::EQ_SYSTEM:: Item ", selected_item.name, " released to slot: ", slot_id)
		selected_item = null

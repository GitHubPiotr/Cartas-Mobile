extends Node

var item
var slots = []
# const 43 in gemae

func _init():
	for i in range(43): slots.append(null)

func fill_slot(slot_id, item):
	slots[slot_id] = item

func clear_slot(slot_id):
	slots[slot_id] = null

func get_content(slot_id):
	return slots[slot_id]

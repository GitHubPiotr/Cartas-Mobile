extends Node

var slots = []

# const 43 in gemae

func _init():
	for i in range(43): slots.append(false)

func fill_slot(slot_id):
	slots[slot_id] = true

func clear_slot(slot_id):
	slots[slot_id] = false

func is_filled_slot(slot_id):
	return slots[slot_id]

extends ProgressBar

signal set_health

func _ready():
	Game.ADD_NODE_TO_REFERENCE_LIST(self)
	max_value = Game.GET_NODE_FROM_REFERENCE_LIST("Player").health
	value = max_value
	connect("set_health", self, "_set_health")

func _set_health(value):
	self.value = value

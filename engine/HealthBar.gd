extends ProgressBar

signal set_health

func _ready():
	Game.ADD_NODE(self)
	connect("set_health", self, "_set_health")

func init(player):
	max_value = player.stats.health
	value = max_value
	get_node("Label").set_health_text(value, max_value)

func _set_health(value):
	self.value = value
	get_node("Label").set_health_text(value, max_value)

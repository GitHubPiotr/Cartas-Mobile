extends Label

func set_health_text(value, max_value):
	self.text = str(value) + "/" + str(max_value)

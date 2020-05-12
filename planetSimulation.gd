extends Spatial

var planets
func _ready():
	planets = get_tree().get_nodes_in_group("planets")
	pass

func _process(delta):
	for planet in planets:
		planet._updateVelocity(planets, delta)
	for planet in planets:
		planet._updatePosition(delta)
	pass

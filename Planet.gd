extends CSGSphere

export var surfaceGravity: int = 50;
export var initialVelocity: Vector3 = Vector3(0, 0, 0)
var currentVelocity = Vector3(0, 0, 0)
var mass

func _ready():
	currentVelocity = initialVelocity
	mass = surfaceGravity * radius * radius / 0.0000674
	print(mass)
	add_to_group("planets")
	pass
	
func _updateVelocity(planets, delta):
	for planet in planets:
		if (planet != self):
			var sqrDst = planet.translation.distance_squared_to(translation)
			var forceDir = translation.direction_to(planet.translation)
			var force = forceDir * 0.0000674 * mass * planet.mass / sqrDst
			var acceleration = force / mass
			currentVelocity += acceleration * delta
	pass

func _updatePosition(delta):
	translate_object_local(currentVelocity * delta)
	pass

#func _process(delta):

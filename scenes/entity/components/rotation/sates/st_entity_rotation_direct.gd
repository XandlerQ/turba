extends StateEntityRotationBase
class_name StateEntityRotationDirect

#region Signals

#endregion

#region Exports
## Director node. Has to have the [Vector2 direction] field.
@export var director: Node
## Turn halflife, seconds to halve the remaining angle to target direction.
@export var thf: float = 0.12
#endregion

#region State

#endregion

#region Methods
#region System
func _ready() -> void:
	assert(object.get_property_list().any(func(p): return p.name == "rotation"), 
		("Object controlled by StateEntityRotationBase must have [float rotation] field.")
	)
	assert(director.get_property_list().any(func(p): return p.name == "direction"), 
		("Object controlled by StateEntityRotationDirect must have [Vector2 direction] field.")
	)
#endregion

#region Interface
func physics_update(delta: float) -> void:
	# Rotate to look in the direction specified in the director
	object.rotation = _align_with_direction(object.rotation, director.direction, delta)
#endregion

#region Private
func _align_with_direction(angle: float, direction: Vector2, delta: float) -> float:
	# Get target angle
	var target: float = direction.angle()

	# Calculate the new angle
	var lambda: float = log(2.) / max(1e-5, thf)
	var alpha: float = 1. - exp(-lambda * delta)
	return lerp_angle(angle, target, alpha)
	
#endregion
#endregion

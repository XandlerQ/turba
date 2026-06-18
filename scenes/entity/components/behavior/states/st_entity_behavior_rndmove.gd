extends StateEntityBehaviorBase
class_name StateEntityBehaviorRNDMove

#region Signals

#endregion

#region Exports
## How strong are the desired direction fluctuations
@export var fluct = 0.01
#endregion

#region State

#endregion

#region Methods
#region System

#endregion

#region Interface
func physics_update(_delta: float) -> void:
	object.desiredLocomotionState = "Walk"
	var dphi: float = randf_range(-fluct, fluct)
	var phi: float = object.desiredDirection.angle()
	phi += dphi
	object.desiredDirection = Vector2.from_angle(phi)

func enter(_previousState: String, _data := {}) -> void:
	object.desiredDirection = Vector2.from_angle(randf_range(0., 2 * PI))
#endregion

#region Private

#endregion
#endregion

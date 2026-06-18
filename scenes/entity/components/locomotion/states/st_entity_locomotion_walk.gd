extends StateEntityLocomotionBase
class_name StateEntityLocomotionWalk

#region Signals

#endregion

#region Exports
## Friction
@export var friction: float = 90.
## Acceleration
@export var acceleration: float = 170.
## Max velocity magnitude
@export var maxMagnitude: float = 80.
#endregion

#region State

#endregion

#region Methods
#region System

#endregion

#region Interface
func physics_update(delta: float) -> void:
	# Accelerate in the desired direction
	object.velocity = _accelerate(object.velocity, acceleration, friction, object.direction, maxMagnitude, delta)
#endregion

#region Private

#endregion
#endregion

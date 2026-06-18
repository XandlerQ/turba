extends StateEntityBehaviorBase
class_name StateEntityBehaviorIdle

#region Signals

#endregion

#region Exports

#endregion

#region State

#endregion

#region Methods
#region System

#endregion

#region Interface
func physics_update(_delta: float) -> void:
	object.desiredLocomotionState = "Idle"
#endregion

#region Private

#endregion
#endregion

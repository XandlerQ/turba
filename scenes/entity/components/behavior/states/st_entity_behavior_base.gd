extends State
# Base class for states that control
# entity behavior. Has an export variable
# [object] for a node that MUST have the [Vector2
# desiredDirection] field
# that is being changed by this state.
class_name StateEntityBehaviorBase

#region Signals

#endregion

#region Exports
## Controlled object. MUST have [Vector2
## desiredDirection] field and [String 
## desiredLocomotionState] field.
@export var object: Node
#endregion

#region State

#endregion

#region Methods
#region System
func _ready() -> void:
	assert(object.get_property_list().any(func(p): return p.name == "desiredDirection"), 
		("Object controlled by StateEntityBehaviorBase must have [Vector2D desiredDirection] field.")
	)
	assert(object.get_property_list().any(func(p): return p.name == "desiredLocomotionState"), 
		("Object controlled by StateEntityBehaviorBase must have [String desiredLocomotionState] field.")
	)
#endregion

#region Interface

#endregion

#region Private

#endregion
#endregion

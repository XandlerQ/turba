extends State
# Base class for states that control
# entity rotation. Has an export variable
# [object] for a node that MUST have the [float
# rotation] field that is being changed
# by this state
class_name StateEntityRotationBase

#region Signals

#endregion

#region Exports
## Controlled object. MUST have [float rotation] field.
@export var object: Node
#endregion

#region State

#endregion

#region Methods
#region System
func _ready() -> void:
	assert(object.get_property_list().any(func(p): return p.name == "rotation"), 
		("Object controlled by StateEntityRotationBase must have [float rotation] field.")
	)
#endregion

#region Interface

#endregion

#region Private

#endregion
#endregion

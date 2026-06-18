extends Node
# Entity rotation component.
# Defines entity rotaiion state.
# Directly changes the [object]'s
# [float rotation] field.
class_name ComponentEntityRotation

#region Signals

#endregion

#region Exports
## Controlled object
@export var object: CharacterBody2D
## Locomotion Finite State Machine
@export var fsml: FSML
#endregion

#region State
## Current rotation
var rotation: float = 0.
#endregion

#region Methods
#region System
func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	fsml.physics_update(delta)
	_control_object()
#endregion

#region Interface

#endregion

#region Private
func _control_object() -> void:
	object.rotation = rotation
#endregion
#endregion

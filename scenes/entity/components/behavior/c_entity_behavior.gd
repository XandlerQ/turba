extends Node
# Entity behavior component
# Defines entity behavior
# Directly controls:
# - entity locomotion FSML state
# - entity rotation FSML state
# - entity locomotion movement direction
class_name ComponentEntityBehavior

#region Signals
signal changed_desired_state(oldState: String, newState: String)
signal got_collision_from_locomotion_component(normal: Vector2)
#endregion

#region Exports
## Owner object
@export var object: CharacterBody2D
## Behavior Finite State Machine
@export var fsml: FSML
## Locomotion component
@export var locomotionComponent: ComponentEntityLocomotion
#endregion

#region State
## Desired direction
var desiredDirection: Vector2 = Vector2.RIGHT
## Desired locomotion state
var desiredLocomotionState: String = "":
	set(newState):
		if newState == desiredLocomotionState:
			return
		var oldState: String = desiredLocomotionState
		desiredLocomotionState = newState
		locomotionComponent.request_state_change(newState)
		changed_desired_state.emit(oldState, newState)
	get:
		return desiredLocomotionState
#endregion

#region Methods
#region System
func _ready() -> void:
	locomotionComponent.collided.connect(_on_locomotion_component_collided)

	

func _physics_process(delta: float) -> void:
	fsml.physics_update(delta)
	locomotionComponent.direction = desiredDirection
#endregion

#region Interface

#endregion

#region Private
func _on_locomotion_component_collided(normal: Vector2) -> void:
	# TODO: move this behaviour to every state (base state)
	if normal.dot(desiredDirection) < 0.:
		desiredDirection = desiredDirection.bounce(normal)
	got_collision_from_locomotion_component.emit(normal)
#endregion
#endregion

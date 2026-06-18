extends Node
# Entity locomotion component.
# Defines entity locomotion state.
# Directly changes the [object]'s
# [Vector2D velocity] field.
class_name ComponentEntityLocomotion

#region Signals
signal collided(normal: Vector2)
#endregion

#region Exports
## Controlled object.
@export var object: CharacterBody2D
## Locomotion Finite State Machine.
@export var fsml: FSML

## Wall bounce coefficient.
@export var wallBounceCoeff: float = 0.54
#endregion

#region State
## Current velocity.
var velocity: Vector2 = Vector2.ZERO
## Current movement direction.
var direction: Vector2 = Vector2.RIGHT:
	set(dir):
		if dir.length() < 1e-5:
			direction = Vector2.RIGHT
			return
		direction = dir.normalized()
	get:
		return direction
#endregion

#region Methods
#region System
func _ready() -> void:
	# Set random direction
	var angle = randf_range(0., 2 * PI)
	direction = Vector2.from_angle(angle)

func _physics_process(delta: float) -> void:
	fsml.physics_update(delta)
	if _control_object(): _handle_collisions()
#endregion

#region Interface
func request_state_change(newState: String) -> void:
	fsml.change_state(fsml.state, newState)
#endregion

#region Private
func _control_object() -> bool:
	object.velocity = velocity;
	return object.move_and_slide()

func _handle_collisions() -> void:
	for i in range(object.get_slide_collision_count()):
		var collision: KinematicCollision2D = object.get_slide_collision(i)
		var normal = collision.get_normal()

		collided.emit(normal)
		
		# Bounce off the wall
		if normal.dot(direction) < 0.:
			direction = direction.bounce(normal)
		if normal.dot(velocity) < 0.:
			velocity = wallBounceCoeff * velocity.bounce(normal)
#endregion
#endregion

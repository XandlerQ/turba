extends Node2D
# Agent sensing component
# Defines agent environment sensing
# Stores and updates information on the
# parts of the environment that agent
# senses
class_name ComponentAgentSensing

#region Signals

#endregion

#region Exports
## Component owner
@export var ownerAgent: Agent
## The area that defines entity sensing
@export var visionArea: Area2D
#endregion

#region State
var agentsSeen: Array[Agent] = []
#endregion

#region Methods
#region System
func _ready() -> void:
	visionArea.body_entered.connect(_on_vision_body_entered)
	visionArea.body_exited.connect(_on_vision_body_exited)
#endregion

#region Interface

#endregion

#region Private
func _on_vision_body_entered(body: Node2D) -> void:
	print("Body entered")
	var agent = body as Agent
	if agent and agent != ownerAgent and not agentsSeen.has(agent):
		print("Other agent added to vision")
		agentsSeen.append(agent)

func _on_vision_body_exited(body: Node2D) -> void:
	var agent = body as Agent
	if agent:
		print("Other agent removed from vision")
		agentsSeen.erase(agent)
#endregion
#endregion

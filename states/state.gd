class_name State
extends Node

var physics_component : PhysicsComponent
var controller : Controller

func init(physics_component : PhysicsComponent, controller : Controller) -> void:
	self.physics_component = physics_component
	self.controller = controller

func enter() -> void:
	print(name)
	pass
	
func exit() -> void:
	pass
	
func process_frame(delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	return null

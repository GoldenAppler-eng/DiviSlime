class_name StateMachine
extends Node

@export var initial_state : State

var current_state : State 

func init(physics_component : PhysicsComponent, controller : Controller) -> void:
	for child in get_children():
		if not (child is State):
			continue
		
		var state : State = child as State
		state.init(physics_component, controller)
	
	change_state(initial_state)

func process_physics(delta : float) -> void:	
	var new_state : State = current_state.process_physics(delta)
	
	if new_state:
		change_state(new_state)
	
func process_frame(delta: float) -> void:
	var new_state : State = current_state.process_frame(delta)
	
	if new_state:
		change_state(new_state)	
	
func change_state(new_state : State) -> void:
	if current_state:
		current_state.exit()
	
	current_state = new_state
	current_state.enter()

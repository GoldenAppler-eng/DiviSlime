extends State

@export var move_state : State
@export var jump_state : State

func enter() -> void:
	super()
	physics_component.stop_moving()
	
func exit() -> void:
	super()
	
func process_frame(delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if controller.get_horizontal_axis():
		return move_state
		
	if controller.get_jump_request() and physics_component.object_is_on_floor():
		return jump_state
	
	return null

extends State

@export var idle_state : State
@export var jump_state : State

func enter() -> void:
	super()
	
func exit() -> void:
	super()
	
func process_frame(delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if not controller.get_horizontal_axis():
		return idle_state
	
	if controller.get_jump_request() and physics_component.object_is_on_floor():
		return jump_state
		
	physics_component.move(controller.get_horizontal_axis())
		
	return null

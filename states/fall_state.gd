extends State

@export var idle_state : State
@export var move_state : State

func enter() -> void:
	super()
	
func exit() -> void:
	super()
	
func process_frame(delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if physics_component.object_is_on_floor():		
		if controller.get_horizontal_axis():
			return move_state
		
		return idle_state
		
	physics_component.move(controller.get_horizontal_axis())
		
	return null

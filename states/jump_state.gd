extends State

@export var fall_state : State

func enter() -> void:
	super()
	physics_component.schedule_jump()
	
func exit() -> void:
	super()
	
func process_frame(delta: float) -> State:
	return null
	
func process_physics(delta: float) -> State:
	if physics_component.get_object_velocity().y >= 0:
		return fall_state
	
	physics_component.move(controller.get_horizontal_axis())
	
	return null

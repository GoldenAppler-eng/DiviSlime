extends CharacterBody2D

@export var controller : Controller
@export var physics_component : PhysicsComponent
@export var state_machine : StateMachine

func _ready() -> void:
	state_machine.init(physics_component, controller)
	physics_component.init(self)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	physics_component.process_physics(delta)
	

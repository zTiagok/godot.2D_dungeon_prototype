@icon("res://Assets/Dev/Icons/spark-full-white.png")
class_name StateMachine extends Node


@export var initialState: State


signal StateChanged


var currentState: State
var lastState: State
var states: Dictionary[String, State] = {}


func _ready():
	# Percorre todas as childs, verificando se são states. Caso sim, salvará dentro da lista.
	for child in self.get_children():
		if child is State:
			child.stateMachine = self
			child.entity = self.get_parent()
			states[child.name] = child

	# Caso já tenha um estado inicial, ele irá inicia-lo. Caso não, um erro ocorre.
	if initialState:
		initialState.Enter()
		currentState = initialState
	else:
		push_error("No initial state has been set for " + self.get_parent().name)


func _process(delta: float) -> void:
	# Caso exista um state atual, rode o "_process()" dele.
	if currentState:
		currentState.Update(delta)


func _physics_process(delta: float) -> void:
	# Caso exista um state atual, rode o "_physics_process()" dele.
	if currentState:
		currentState.PhysicsUpdate(delta)


func ChangeState(newStateName: String) -> void:
	# Utiliza o parâmetro de nome para procurar dentro da lista o state desejado.
	var newState: State = states.get(newStateName)

	# Caso ele não exista, um erro surgirá.
	assert(newState, "State not found: " + newStateName)

	# Se já estiver um state funcionando no momento, ele será encerrado...
	if currentState:
		currentState.Exit()
	
	# ...para assim iniciar o novo state passado no parâmetro.
	newState.Enter()

	# Salva qual o último state utilizado.
	lastState = currentState

	# Após inicia-lo acima, irá salvar a variável como este novo state iniciado.
	currentState = newState

	# E irá emitir um sinal para todos os nodes conectados, dizendo que o state mudou.
	StateChanged.emit(newStateName)

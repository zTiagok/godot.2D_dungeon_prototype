extends State

var enemy: EnemyBehaviour

@export_category("AI")
@export var minStateDuration : float = 0.5
@export var maxStateDuration : float = 1.5
@export var nextState : State

var timer : float = 0.0


func Enter() -> void:
	enemy = entity

	# Inicia a animação de Idle.
	enemy.StartAnimation(self)

	# Quando entrar nesse estado, a velocidade será anulada.
	enemy.velocity = Vector2.ZERO

	# Irá pegar um número aleatório entre o range mínimo e máximo.
	timer = randf_range(minStateDuration, maxStateDuration)


func Update(_delta: float) -> void:
	# Timer vai diminuindo a cada segundo.
	timer -= _delta

	# Quando o timer zerar, será alterado o state.
	if timer <= 0:
		stateMachine.ChangeState(nextState.name)

extends State

var enemy : EnemyBehaviour

@export var stateDuration : float = 1.0
@export var maxStateCycles : int = 3
@export var minStateCycles : int = 1
@export var nextState : State

var timer : float = 0.0
var direction : Vector2
var cardinalDirections : Array[Vector2] = [ Vector2.UP, Vector2.RIGHT, Vector2.DOWN, Vector2.LEFT] 

func Enter() -> void:
	enemy = entity
	enemy.StartAnimation(self, "Move")

	# Inicia um timer, no qual escolhe uma quantidade aleatória de cíclos e multiplica
	# pela duração do estado.
	timer = randf_range(minStateCycles, maxStateCycles) * stateDuration

	# Seleciona uma direção aleatória.
	direction = cardinalDirections[randf_range(0, 3)]

	# Pega a direção e multiplica sobre 1/3 da velocidade atual do Vampiro, para
	# que ele fique percorrendo.
	enemy.velocity = direction * (enemy.entity.movementSpeed / 3)

func Update(_delta: float) -> void:
	# Timer vai diminuindo a cada segundo.
	timer -= _delta

	# Caso o timer chegue a zero, irá retornar ao "Idle" state.
	if timer <= 0:
		stateMachine.ChangeState("Idle")
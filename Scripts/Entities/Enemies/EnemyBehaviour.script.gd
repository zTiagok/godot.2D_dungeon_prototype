class_name EnemyBehaviour extends CharacterBody2D

@export var entity : EntityResource

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
var player : PlayerBehaviour

func _ready() -> void:
	player = PlayerManager.player
	assert(entity, "Missing entity resource for %s." % self.name)

func _physics_process(_delta: float) -> void:
	move_and_slide()

# Função utilizada dentro dos States, no qual chamam-no para trocar a animação.
# Caso o "animationName" seja passado, ele irá anular o valor de "state".
func StartAnimation(state: State, animationName: String = "") -> void:
	# Inicia uma animação com base no nome do estado.
	if state && animationPlayer:
		animationPlayer.play(animationName.capitalize() if animationName != "" else state.name.capitalize())
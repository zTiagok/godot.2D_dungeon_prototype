class_name EnemyBehaviour extends CharacterBody2D

@export var entity : EntityResource

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
var player : PlayerBehaviour

func _ready() -> void:
	assert(entity, "Missing entity resource for %s." % self.name)

func _physics_process(_delta: float) -> void:
	move_and_slide()

# Função utilizada dentro dos States, no qual chamam-no para trocar a animação.
func StartAnimation(state: State) -> void:
	# Inicia uma animação com base no nome do estado.
	if state && animationPlayer:
		animationPlayer.play(state.name.capitalize())
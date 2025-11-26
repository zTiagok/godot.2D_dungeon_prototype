class_name EnemyBehaviour extends CharacterBody2D


@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@onready var hurtbox: Hurtbox = $Interactions/Hurtbox
@onready var stateMachine: StateMachine = $StateMachine
@onready var sprite: Sprite2D = $Sprite2D
var player : PlayerBehaviour
var knockbackForceReceived : float = 0.0


@export var entity : EntityResource


func _ready() -> void:
	player = PlayerManager.player
	assert(entity, "Enemy %s is missing an entity resource." % self.name)
	assert(hurtbox, "Hurtbox is missing on the entity.")
	assert(stateMachine, "StateMachine is missing on the entity.")

	# Conecta o sinal da Hurtbox na função abaixo.
	hurtbox.DamageReceived.connect(OnDamaged)


func _physics_process(_delta: float) -> void:
	move_and_slide()


# Função utilizada dentro dos States, no qual chamam-no para trocar a animação.
# Caso o "animationName" seja passado, ele irá anular o valor de "state".
func StartAnimation(state: State, animationName: String = "") -> void:
	# Inicia uma animação com base no nome do estado.
	if state && animationPlayer:
		animationPlayer.play(animationName.capitalize() if animationName != "" else state.name.capitalize())


func OnDamaged(damage: float, knockbackForce) -> void:
	knockbackForceReceived = knockbackForce
	
	# Chama a função dentro do EntityResource, no qual verifica o dano e retorna o state apropriado.
	if entity.TakeDamage(damage) <= 0:
		stateMachine.ChangeState("Die")
	
	else:
		stateMachine.ChangeState("Stun")
class_name EnvironmentBehaviour extends StaticBody2D

@export var entity : EntityResource

@onready var hurtbox : Hurtbox = $Interactions/Hurtbox

func _ready() -> void:
	assert(entity, "Environment %s is missing an entity resource." % self.name)
	assert(hurtbox, "Hurtbox is missing on the entity.")

	# Conecta o sinal da Hurtbox na função abaixo.
	hurtbox.DamageReceived.connect(OnDamaged)

func OnDamaged(damage: float) -> void:
	# Chama a função dentro do EntityResource, no qual verifica o dano e retorna o valor da vida atual.
	if entity.TakeDamage(damage) <= 0:
		queue_free()

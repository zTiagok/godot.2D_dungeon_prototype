class_name EnvironmentBehaviour extends StaticBody2D

@export var entity : EntityResource

@onready var hurtbox : Hurtbox = $Interactions/Hurtbox

func _ready() -> void:
	assert(entity, "Environment %s is missing an entity resource." % self.name)
	assert(hurtbox, "Hurtbox is missing on the entity.")

	# Conecta o sinal da Hurtbox na função abaixo.
	hurtbox.DamageReceived.connect(TakeDamage)

func TakeDamage(damage: float) -> void:
	if damage >= entity.health:
		queue_free()
	else:
		entity.health -= 1

class_name EntityResource extends Resource

@export var health : float = 5.0
@export var currentDamage : float = 0.0
@export var movementSpeed : float = 0.0
@export var canTakeDamage : bool = true

# Função utilizada para todas as entidades para manipular o dano recebido.
func TakeDamage(damage: float) -> void:
  if (canTakeDamage):
    health -= damage
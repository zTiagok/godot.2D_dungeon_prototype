class_name EntityBehaviour extends CharacterBody2D

@export var health : float = 5.0
@export var movementSpeed : float = 0.0
@export var canTakeDamage : bool = true

func _ready() -> void:
  self.motion_mode = CharacterBody2D.MOTION_MODE_FLOATING



# Função utilizada para todas as entidades para manipular o dano recebido.
func TakeDamage(damage: float) -> void:
  if (canTakeDamage):
    health -= damage
    print(health)
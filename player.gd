extends Area2D
@export var speed = 400
var screen_size
var tipo_movimiento = ""
func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		tipo_movimiento = "vertical"
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		tipo_movimiento = "vertical"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		tipo_movimiento = "horizontal"
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		tipo_movimiento = "horizontal"
	
	if velocity.length()>0:
		velocity = velocity.normalized() * speed
		if tipo_movimiento == "vertical":
			$AnimatedSprite2D.play("arriba")
		else:
			$AnimatedSprite2D.play("caminar")
	else:
		$AnimatedSprite2D.stop()
	position += velocity*delta
	position = position.clamp(Vector2.ZERO, screen_size)
	

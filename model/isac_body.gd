extends Area2D
signal hit
signal yes



@export var speed = 400
var screenSize
var velocity = Vector2.ZERO
var friction = 0.95
var acceleration = 2000 # Ajustez cette valeur selon vos besoins
var maxSpeed = 200

func _ready():
	screenSize = get_viewport_rect().size
	hide()


func _process(delta):
	var input_vector = Vector2.ZERO
	if Input.is_action_pressed("MoveRight"):
		$bodySprite.animation = "WalkH"
		$bodySprite.flip_h = 0
		$isacHead/headSprite.animation = "tearsH"
		$isacHead/headSprite.flip_h = 0
		
		input_vector.x += 1
	if Input.is_action_pressed("MoveLeft"):
		$bodySprite.animation = "WalkH"
		$bodySprite.flip_h = 1
		$isacHead/headSprite.animation = "tearsH"
		$isacHead/headSprite.flip_h = 1
		input_vector.x -= 1
	if Input.is_action_pressed("MoveUp"):
		$bodySprite.animation = "WalkV"
		$isacHead/headSprite.animation = "tearsB"
		input_vector.y -= 1
	if Input.is_action_pressed("MoveDown"):
		$bodySprite.animation = "WalkV"
		$isacHead/headSprite.animation = "tearsF"
		input_vector.y += 1

	# Ajout de friction
	velocity *= friction

	# Ajout de l'accélération en fonction de la touche enfoncée
	velocity += input_vector.normalized() * acceleration * delta


	if velocity.length() > .5:
		$bodySprite.play()
	else:
		$bodySprite.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screenSize)
	
	$infoLabel.text = "postion x :"+str(int(velocity.x))+" position y : "+str(velocity.length())
	
	if  velocity.x < 100 and velocity.x > -100 :
		$isacHead/headSprite.animation = "tearsF"
		$bodySprite.animation = "WalkV"
	
	
		
	


func _on_body_entered(body):
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled",true)


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

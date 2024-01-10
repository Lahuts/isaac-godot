extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ShotRight"):
		shot("tearsH",0)
	if Input.is_action_pressed("ShotLeft"):
		shot("tearsH",1)
	if Input.is_action_pressed("ShotUp"):
		shot("tearsB",1)
	if Input.is_action_pressed("ShotDown"):
		shot("tearsF",1)
	elif !Input.is_action_pressed('ShotUp') and !Input.is_action_pressed('ShotRight') and !Input.is_action_pressed('ShotLeft') and !Input.is_action_pressed('ShotDown'):
		$headSprite.stop()
	

	


func shot(direction,flip) :
	$headSprite.animation = direction
	$headSprite.flip_h = flip
	$headSprite.play()
	



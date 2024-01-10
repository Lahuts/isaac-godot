extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$isacBody.start($StartPosition.position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$log.text = str(delta)
	pass

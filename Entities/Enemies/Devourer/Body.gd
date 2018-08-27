extends Area2D

var previous = null
var next = null
var positionManagerScript = preload("res://Entities/Enemies/Devourer/PositionRegister.gd")
var positionManager = null

func setBodies(previous, next):
	self.previous = previous
	self.next = next
	positionManager = positionManagerScript.new()
	positionManager.initPositions(Vector2(0,1000000), 0, previous.positionManager.getNumPositions(), previous.positionManager.speed)
	

func _process(delta):
	pass

func update():
	if next == null:
		set_body(false)
	else:
		set_body(true)
	global_position = previous.positionManager.getPosition()
	global_rotation = previous.positionManager.getRotation()
	positionManager.updatePositions(global_position, global_rotation)
	if next != null:
		next.update()

func set_body(body = true):
	if body:
		$Sprite.frame = 1
	else:
		$Sprite.frame = 2
func grow(length):
	next = self.duplicate()
	add_child(next)
	next.setBodies(self, null)
	if length > 0:
		next.grow(length-1)
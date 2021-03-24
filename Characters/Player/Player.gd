extends KinematicBody2D

export(int) var MAX_SPEED = 400
export(int) var ACCELERATION = 8000
export(int) var FRICTION = 10000

enum {
	MOVE,
	READ,
	SIT1,
	PHONE,
	SHOPPING,
}

var velocity = Vector2.DOWN
var state = MOVE

onready var idleSprite = $IdleSprite
onready var moveSprite = $MoveSprite
onready var sit1Sprite = $Sit1Sprite
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
var facing = "r"

func _ready():
	animationTree.active = true
	change_sprite(idleSprite)
	animationTree.set("parameters/Idle/blend_position", velocity)

func _physics_process(delta):
	match state:
		SIT1:
			sit1_state()
		MOVE:
			move_state(delta)

func sit1_state():
	change_sprite(sit1Sprite)
	animationState.travel("Sit1")

func move_state(delta):
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputVector = inputVector.normalized()
	
	if inputVector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", inputVector)
		animationTree.set("parameters/Move/blend_position", inputVector)
		change_sprite(moveSprite)
		animationState.travel("Move")
		velocity = velocity.move_toward(inputVector * MAX_SPEED, ACCELERATION * delta)
	else:
		change_sprite(idleSprite)
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move()

func move():
	velocity = move_and_slide(velocity)
	
func change_sprite(sprite):
	idleSprite.visible = false
	moveSprite.visible = false
	sit1Sprite.visible = false
	sprite.visible = true
	

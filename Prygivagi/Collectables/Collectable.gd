extends Area2D

@export var itemRes: InventoryItem
@onready var label: Label = $Label

func collect(inventory: Inventory):
	inventory.insert(itemRes)
	queue_free()

var player_in_area = false

func _ready():
	label.visible = false

func _on_body_entered(body):
	if body.has_method("on_item_picked_up"):
		body.on_item_picked_up()
	if body.name == "PlayerRaccoon":
		player_in_area = true
		label.visible = true

func _on_body_exited(body):
	if body.name == "PlayerRaccoon":
		player_in_area = false
		label.visible = false

func _process(_delta):
	if player_in_area and Input.is_action_just_pressed("ui_accept"):
		queue_free()
		
		var player_node = get_node("/root/Characters/")
		if player_node:
			player_node.play_action_animation()


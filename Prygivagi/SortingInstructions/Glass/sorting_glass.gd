class_name SortingGlass
extends Control

@onready var back_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/Back_Button
@onready var next_button: Button = $MarginContainer/VBoxContainer/HBoxContainer/Next_Button
@onready var exit_button: Button = $MarginContainer/VBoxContainer/HBoxContainer2/Exit_Button
@onready var click_button_sfx: AudioStreamPlayer = $ClickButtonSfx
@onready var margin_container = $MarginContainer
@onready var sorting_waste = $SortingWaste as SortingWaste

signal back_to_paper_page

func _ready():
	handle_connecting_signals()
	set_process(false)

func on_next_pressed() -> void:
	margin_container.visible = false
	sorting_waste.visible = true
	click_button_sfx.play()
	set_process(false)

func on_back_pressed() -> void:
	pass

func reload_pause_menu():
	get_tree().change_scene_to_file("res://Pausemenu/pausemenu.tscn")

func on_exit_pressed() -> void:
	reload_pause_menu()

func handle_connecting_signals() -> void:
	back_button.button_down.connect(on_back_pressed)
	next_button.button_down.connect(on_next_pressed)
	exit_button.button_down.connect(on_exit_pressed)
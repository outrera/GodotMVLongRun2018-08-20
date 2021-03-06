extends Node

signal player_hp
signal player_mana
signal player_keys

export var player_hp = 100 setget player_hp_emitter
export var player_mana = 100 setget player_mana_emitter
export var player_keys = 0 setget player_keys_emitter

func player_hp_emitter(val):
	player_hp = val
	emit_signal("player_hp")

func player_mana_emitter(val):
	player_mana = val
	emit_signal("player_mana")

func player_keys_emitter(val):
	player_keys = val
	emit_signal("player_keys")
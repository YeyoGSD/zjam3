extends Node

@warning_ignore("unused_signal")
signal player_got_hurt(damage: int)
@warning_ignore("unused_signal")
signal radio_message_show_requested(text: String)
@warning_ignore("unused_signal")
signal radio_message_hide_requested(text: String)
@warning_ignore("unused_signal")
signal player_died()
@warning_ignore("unused_signal")
signal player_first_hit()
@warning_ignore("unused_signal")
signal player_lives_changed(new_lives: int)

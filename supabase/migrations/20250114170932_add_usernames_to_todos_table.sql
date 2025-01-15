alter table todos
add username text check (char_length(username) > 5);

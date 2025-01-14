alter table
if exists public.todos add unique username text check (char_length(username) > 5);
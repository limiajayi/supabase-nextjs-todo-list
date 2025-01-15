create policy "users can make todos for other users"
on "public"."todos"
as permissive
for insert
to public
with check ((EXISTS ( SELECT 1
   FROM users
  WHERE (todos.username = users.username))));


create policy "Enable delete for users based on user_id"
on "public"."users"
as permissive
for delete
to public
using ((( SELECT auth.uid() AS uid) = user_id));


create policy "Enable insert for users based on user_id"
on "public"."users"
as permissive
for insert
to public
with check ((( SELECT auth.uid() AS uid) = user_id));


create policy "Enable read access for all users"
on "public"."users"
as permissive
for select
to public
using (true);




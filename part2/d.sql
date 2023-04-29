-- Below is a dummy query, if we leave it empty then the SQLITE package will throw a non-readable error
-- Change the query to pass the test :)
select users.first_name, users.last_name 
from users
join favorites
where users.id == favorites.user_id and favorites.dog_id == (select dogs.id from dogs where dogs.name == "Zoey");

-- I think if we have tons of data, join will run slow. This might be more efficient for larger databases. 
-- another implementation
-- select users.first_name, users.last_name
-- from users
-- where users.id == (select favorites.user_id from favorites where favorites.dog_id == (select dogs.id from dogs where dogs.name == "Zoey"));
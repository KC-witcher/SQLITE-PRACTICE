To complete part 1, run `npm run test-1` and follow through this readme until you pass all of the tests. All you should need to do is change your `main.db` file through your sqlite CLI, and then rerun the tests as you go.

We will need to do a few things to set up our database. We will need three tables:

1. Users Table

   - id: auto incrementing primary id
   - first_name string
   - last_name string
   - motto string nullable

   CREATE TABLE users(
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL,
   motto TEXT
   );

2. Dogs Table

   - id: auto incrementing primary id
   - name string

   CREATE TABLE dogs(
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT NOT NULL
   );

3. Favorites Table

   - should tie together users and dogs with foreign id's
   - needs `user_id` & `dog_id` keys
   - must be foreign keys

   CREATE TABLE favorites(
   user_id INTEGER,
   dog_id INTEGER,
   FOREIGN KEY(user_id) REFERENCES users(id),
   FOREIGN KEY(dog_id) REFERENCES dogs(id),
   UNIQUE(user_id, dog_id)
   );

We will also need to create some entries in these tables:

1. Users

   - Create a user named Jon Higgz, who's life motto is "I love coding".
   - Create a user named Andrey Rusterton, who's life motto is "I love coding even more".
   - Create a user named Peter Garboni, who's life motto is "I love coding even more".

   INSERT INTO users (first_name, last_name, motto) VALUES("Jon", "Higgz", "I love coding");
   INSERT INTO users (first_name, last_name, motto) VALUES("Andrey", "Rusterton", "I love coding even more");
   INSERT INTO users (first_name, last_name, motto) VALUES("Peter", "Garboni", "I love even coding");

2. Dogs

   - Create a dog named DOOMSLAYER
   - Create a dog named Zoey
   - Create a dog named Jefferey

   INSERT INTO dogs (name) VALUES("DOOMSLAYER");
   INSERT INTO dogs (name) VALUES("Zoey");
   INSERT INTO dogs (name) VALUES("Jefferey");

3. Favorites

   - Peter Favorites Doomslayer
   - Jon Favorites Doomslayer
   - Andrey Favorites Doomslayer
   - Jon Favorites Jefferey
   - Andrey favorites Zoey

   INSERT INTO favorites(user_id, dog_id) VALUES(3, 1);
   INSERT INTO favorites(user_id, dog_id) VALUES(1, 1);
   INSERT INTO favorites(user_id, dog_id) VALUES(2, 1);
   INSERT INTO favorites(user_id, dog_id) VALUES(1, 3);
   INSERT INTO favorites(user_id, dog_id) VALUES(2, 2);

Go ahead and run `npx jest part1 --watch`. You will need to create a `main.db` and change it via your `sqlite` command on your terminal. As you begin to setup your database you should notice that the tests will respond to the changes if you rerun it.

Once main.db is set up correctly and all of your part 1 tests are passing you may move on to part 2.

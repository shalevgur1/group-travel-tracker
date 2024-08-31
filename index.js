import express from "express";
import bodyParser from "body-parser";
import pg from "pg";

const app = express();
const port = 3000;

// ### IMPORTANT ### Change credentials below this comment to connect to postgres server on your own PC!
const db = new pg.Client({
  user: "postgres",
  host: "localhost",
  database: "world",
  password: "123456",
  port: 5432,
});
db.connect();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

let currentUserId = 1;

let users = [];

async function checkVisisted() {
  const result = await db.query("SELECT country_code FROM visited_countries WHERE member_id = $1", [currentUserId]);
  let countries = [];
  result.rows.forEach((country) => {
    countries.push(country.country_code);
  });
  return countries;
}

async function getMembers(){
  const result = await db.query("SELECT * FROM tracker_members");
  return result.rows;
}

app.get("/", async (req, res) => {
  users = await getMembers();
  const countries = await checkVisisted();
  const currentUser = users.find((user) => user.id === currentUserId);
  res.render("index.ejs", {
    countries: countries,
    total: countries.length,
    users: users,
    color: currentUser.color,
  });
});
app.post("/add", async (req, res) => {
  const input = req.body["country"];

  try {
    const result = await db.query(
      "SELECT country_code FROM countries WHERE LOWER(country_name) LIKE '%' || $1 || '%';",
      [input.toLowerCase()]
    );
    if (result.rows.length !== 0) {
      const data = result.rows[0];
      const countryCode = data.country_code;
      try {
        await db.query(
          "INSERT INTO visited_countries (country_code, member_id) VALUES ($1, $2)",
          [countryCode, currentUserId]
        );
        res.redirect("/");
      } catch (err) {
        if (err.code === '23505')
          users = await getMembers();
          const countries = await checkVisisted();
          const currentUser = users.find((user) => user.id === currentUserId);
          res.render("index.ejs", {
            error: `The country ${req.body.country} is already listed`,
            countries: countries,
            total: countries.length,
            users: users,
            color: currentUser.color,
          });
      }
    } else {
      users = await getMembers();
      const countries = await checkVisisted();
      const currentUser = users.find((user) => user.id === currentUserId);
      res.render("index.ejs", {
        error: `There is no country with the name ${req.body.country}`,
        countries: countries,
        total: countries.length,
        users: users,
        color: currentUser.color,
      });
    }
  } catch (err) {
    console.log(err);
  }
});
app.post("/user", async (req, res) => {
  if (req.body.add)
    res.render("new.ejs");
  else {
    currentUserId = parseInt(req.body.user);
    res.redirect('/');
  }

});

app.post("/new", async (req, res) => {
  //Hint: The RETURNING keyword can return the data that was inserted.
  //https://www.postgresql.org/docs/current/dml-returning.html
  try {
    const result = await db.query(
      "INSERT INTO tracker_members (name, color) VALUES ($1, $2) RETURNING *",
      [req.body.name, req.body.color]
  );
  currentUserId = result.rows[0].id;
  res.redirect('/');
  } catch (err) {
    console.log(err);
  }
  
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});

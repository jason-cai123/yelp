-- \? help
-- \l check the current db
-- \d <table> check table 
-- select * from <table>

CREATE TABLE restaurants (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    price_range INT NOT NULL check(price_range >= 1 AND price_range <= 5)
);

INSERT INTO restaurants (name, location, price_range) values ('Mcdonalds', 'new york', 3);

CREATE TABLE reviews (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    restaurant_id BIGINT NOT NULL REFERENCES restaurants(id),
    name VARCHAR(50) NOT NULL,
    review TEXT NOT NULL,
    rating INT NOT NULL check(rating >=1 and rating <= 5)
);

INSERT into reviews(restaurant_id, name, review, rating) values(1, 'carl', 'restuarant was good', 5);

SELECT trun(AVG(rating),2) as avg_rating from reviews where restaurant_id = 2;
SELECT restaurant_id, count(restaurant_id) from reviews group by restaurant_id;
SELECT * from restaurants inner join reviews on restaurant_id = reviews.restaurant_id;
select * from restaurants left join (select restaurant_id, COUNT(*), TRUNC(AVG(rating),1) as average_rating from reviews group by restaurant_id) reviews on restaurants.id = reviews.restaurant_id;

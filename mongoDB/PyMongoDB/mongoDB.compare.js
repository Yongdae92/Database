///비교연산
//equal
//grater than
//grater than equal
//less than
//less than equal
//not equal
//in
//not in

//논리연산
//and
//or
//not
//nor

db.product.find({price: {$gt: 100}})
db.emplyoees.find({$or: [{age: {$lte: 30}}, {department: "HR"}] })
DB.orders.find({quantity:{$gte: 5, $lte: 10}})
db.customers.find({city: {$ne: "Seoul"}})
db.movies.find({rating: {$gte: 8}, genre: {$in: ["comedy", "drama"]}})
db.books.find({author: "John Doe", publishedYear: {$gt: 2000}})
db.vehicle.find({type: {$ne: "car"}, price: {$gt: 20000}})
db.restaurants.find({rating: 5, cuisine: {$nin: ["Italian", "French"]}})
db.users.find({age: {$gte: 30}, city: {$ne: "New York"}})
db.fights.find({$or: [{departure: "London"}, {arrival: "Tokyo"}]})
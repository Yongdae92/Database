//컬렉션 생성 
db.sports.insertOne({name: "football", player: 11})

//읽기 
db.products.find({price : {$lte: 500}})
db.books.find({author: "John Doe"})

//update 
db.orders.updateMany({satus: "Pending"}, {$set: {statu: "Complete"}})
db.movies.updateMany({genre: "comedy"}, {$set: {rating: 5 }})

//delete 
db.customers.deleteMany({age: {$lt: 30}})

//중급 

//생성
db.myCollection.insertOne({name: 'Gadget', type: 'Electronics', price: 300, rating: [4,5,6]})


//읽기
db.employees.find({department: "Sales", age: {$gte: 30}})
db.emplyees.find({salary: {$gte: 50000}}, {name: 1, title: 1})

//업데이트 

db.products.updateMany({stock: {$exists: false}}, {$set: {stock: 10}})
db.vehicles.updateMany({type: "car"}, {$set: {wheel: 4}})

//삭제
db.orders.deleteMany({orderDate: {$lt: new Date('2023-01-01')}})
db.restaurants.deleteMany({rating: {$lt: 3}})

//고급
//읽기 
db.customers.find({age: {$gte: 30}}).sort({name: 1})
db.users.aggregate([{$match: {birthday: {$lt: new Date('1990-01-01')}}}, {$group: {_id: null, avgAge: {$avg: "$age"}}}])

//update 
db.employees.updateMany({department: "HR"}, {$set: {department: "Human Resoures", title: "HR Manager"}})
db.orders.updateMany({delivered: false}, {$set: {deliveryDate: new Date()}})   

//delete 
db.products.deleteMany({lastMondified: {$lt: new Date(new date() - 30 * 24 * 60 * 60 * 1000)}})    
db.products.deleteMnay({stock: 0})
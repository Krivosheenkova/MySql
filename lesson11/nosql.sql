"""
1. В базе данных Redis подберите коллекцию для подсчета посещений с определенных IP-адресов.
"""

127.0.0.1:6379> SADD ip '247.143.72.159' '188.110.94.228' '80.159.226.243' '110.91.189.87'
  (integer) 4
127.0.0.1:6379> SMEMBERS ip
  1) "80.159.226.243"
  2) "247.143.72.159"
  3) "127.0.0.1"
  4) "188.110.94.228"
  5) "110.91.189.87"
127.0.0.1:6379> SCARD ip
  (integer) 5


"""
2. При помощи базы данных Redis решите задачу поиска имени пользователя по электронному адресу и наоборот,
поиск электронного адреса пользователя по его имени.
"""
127.0.0.1:6379> hset user_email 'user01' 'user01@mail.ru'
  (integer) 1
127.0.0.1:6379> hset email_user 'user01@mail.ru' 'user01'
  (integer) 1
127.0.0.1:6379> hget user_email 'user01'
  "user01@mail.ru"
127.0.0.1:6379> hget email_user 'user01@mail.ru'
  "user01"
-- какое-то странное это решение. видимо, я не очень пока понимаю что к чему.


"""
3. Организуйте хранение категорий и товарных позиций учебной базы данных shop в СУБД MongoDB.
"""

> db.shop.catalogs.insertMany([{ _id: 1, name: "Процессоры"}, { _id: 2, name: "Материнские платы"}, { _id: 3 ,name: "Видеокарты"}]);

> db.shop.products.insert({name: 'AMD FX-8320E', desc: 'Процессор для настольных персональных компьютеров, основанных на платформе AMD.', price: 4780.00, catalog_id: 1})
WriteResult({ "nInserted" : 1 })

> db.shop.products.update({catalog_id: 1}, {$set: {created_at: new Date()}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })

> db.shop.products.insert({name: 'MSI B250M GAMING PRO', desc: 'Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX', price: 5060.00, catalog_id: 2, created_at: new Date()})
WriteResult({ "nInserted" : 1 })

> db.shop.products.find().pretty()
{
	"_id" : ObjectId("5ff096327ead99c2af44139d"),
	"name" : "AMD FX-8320E",
	"desc" : "Процессор для настольных персональных компьютеров, основанных на платформе AMD.",
	"price" : 4780,
	"catalog_id" : 1,
	"created_at" : ISODate("2021-01-02T15:54:36.465Z")
}
{
	"_id" : ObjectId("5ff097f97ead99c2af44139e"),
	"name" : "MSI B250M GAMING PRO",
	"desc" : "Материнская плата MSI B250M GAMING PRO, B250, Socket 1151, DDR4, mATX",
	"price" : 5060,
	"catalog_id" : 2,
	"created_at" : ISODate("2021-01-02T15:58:22.862Z")
}

> db.shop.catalogs.find()
{ "_id" : 1, "name" : "Processors" }
{ "_id" : 2, "name" : "Mothers" }
{ "_id" : 3, "name" : "Video" }

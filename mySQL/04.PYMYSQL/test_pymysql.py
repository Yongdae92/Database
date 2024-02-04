import pymysql

# 1. db connection
connection = pymysql.connect(
    host = '127.0.0.1',
    user = 'root',
    password = '2399',
    db = 'classicmodels',
    charset = 'utf8mb4',
    cursorclass = pymysql.cursors.DictCursor
)


# 2. CRUD

## 1. SELECT * FROM
def get_customers():
    cursor = connection.cursor()

    sql = 'SELECT * FROM customers'
    cursor.execute(sql)

    customers = cursor.fetchone()
    print('customer : ', customers)
    print('customer : ', customers['customerNumber'])
    print('customer : ', customers['customerName'])
    print('customer : ', customers['country'])
    cursor.close()

## 2. INSERT INTO
def add_customer():
    cursor = connection.cursor()
    
    name = 'yongdae'
    family_name = 'kwon'
    sql = f'INSERT INTO customers(customerNumber, customerName, contactLastName) VALUES({1005}, "{name}", "{family_name}")'
    cursor.execute(sql)
    connection.commit()
    cursor.close()

# add_customer()

## 3. UPDATE SET
def update_customer():
    cursor = connection.cursor()
    update_name = 'update_yongdae'
    contactLastName = 'update_kwon'
    sql = f"UPDATE customers SET customerName = '{update_name}', contactLastName = '{contactLastName}' WHERE customerNumber = 1000"

    cursor.execute(sql)
    connection.commit()
    cursor.close()

# update_customer()
    
## 4. DELETE FROM
def delete_customer():
    cursor = connection.cursor()
    sql = "DELETE FROM customers WHERE customerNumber = 1000"
    cursor.execute(sql)
    connection.commit()
    cursor.close()

delete_customer()
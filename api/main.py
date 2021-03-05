import pymysql.cursors
import pymysql
import simplejson as json
from app import app
from flask import flash, request
from flask_restful import reqparse

config = {
    'host': 'db',
    'port': 3306,
    'user': 'db',
    'password': 'db',
    'database': 'db'
}
        
@app.route('/api/getall', methods=['GET'])
def getall():
    try:
        conn = pymysql.connect(**config)
        cursor = conn.cursor()
        cursor.execute('SELECT name, lastname, phone, email, age, DATE(customers.registration_date) AS registration_date, genders.gender, status.status, street, city, state, code, country, additional FROM customers LEFT JOIN genders USING(id_gender) LEFT JOIN status USING(id_status)')
        rows = cursor.fetchall()
        cursor.close() 
        conn.close()
        
        res = json.JSONEncoder().encode({'status': 200, 'rows': rows})
        return res

    except Exception as e:

        res = json.JSONEncoder().encode({'status': 400, 'error': format(e)})    
        return res
        
@app.route('/api/add', methods=['POST'])
def add():    
    try:
        parser = reqparse.RequestParser(bundle_errors=True)
        parser.add_argument('name', type=str, location='form')
        parser.add_argument('lastname', type=str, location='form')
        parser.add_argument('phone', type=str, location='form')
        parser.add_argument('email', type=str, location='form')
        parser.add_argument('age', type=str, location='form')
        parser.add_argument('id_gender', type=str, location='form')
        parser.add_argument('id_status', type=str, location='form')
        parser.add_argument('street', type=str, location='form')
        parser.add_argument('city', type=str, location='form')
        parser.add_argument('state', type=str, location='form')
        parser.add_argument('code', type=str, location='form')
        parser.add_argument('country', type=str, location='form')
        parser.add_argument('additional', type=str, location='form')
        args = parser.parse_args()

        conn = pymysql.connect(**config)
        cursor = conn.cursor()
        cursor.execute('INSERT INTO customers (name, lastname, phone, email, age, registration_date, id_gender, id_status, street, city, state, code, country, additional) VALUES (%s, %s, %s, %s, %s, NOW(), %s, 1, %s, %s, %s, %s, %s, %s)', (args.name, args.lastname, args.phone, args.email, args.age, args.id_gender, args.street, args.city, args.state, args.code, args.country, args.additional))
        conn.commit()
        cursor.close() 
        conn.close()

        res = json.JSONEncoder().encode({'status': 200})    
        return res

    except Exception as e:

        res = json.JSONEncoder().encode({'status': 400, 'error': format(e)})    
        return res
        
@app.errorhandler(404)
def not_found(error=None):
    res = json.JSONEncoder().encode({'status': 404})

    return res
        
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
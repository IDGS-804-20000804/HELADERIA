# from decouple import config
# import pymysql


# def get_connection():
#     return pymysql.connect(
#         host=config('MYSQL_HOST'),
#         port=int(config('MYSQL_PORT')),
#         database=config('MYSQL_DB'),
#         user=config('MYSQL_USER'),
#         password=config('MYSQL_PASSWORD')
#     )

import pymysql

def get_connection():
    return pymysql.connect(host='localhost',
                                port=3308,
                                user='pau',
                                password='123456',
                                db='gelatos')

class config:
    SECRET_KEY='ca#s/3!"&)2rf1'
# from decouple import config

# class Config(object):
#     SECRET_KEY = 'MY_SECRET_KEY'
#     SESSION_COOKIES_SECURE = False

# class DevelopmentConfig(Config):
#     DEBUG = True
#     SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://{0}:{1}@{2}:{3}/{4}'.format(config('MYSQL_USER'), config('MYSQL_PASSWORD'), config('MYSQL_PORT'), config('MYSQL_HOST'), config('MYSQL_DB'))
#     SQLALCHEMY_TRACK_MODIFICATIONS = False

# # import os
# from sqlalchemy import create_engine

# class Config(object):
#     SECRET_KEY='MY_SECRET_KEY'
#     SESSION_COOKIES_SECURE=False

# class DevelopmentConfig(Config):
#     DEBUG=True
#     SQLALCHEMY_DATABASE_URI='mysql+pymysql://root:12345678@127.0.0.1/gelatos'
#     SQLALCHEMY_TRACK_MODIFICATION = False

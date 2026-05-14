import os

from dotenv import load_dotenv
from sqlalchemy import create_engine


# Cargar variables .env
load_dotenv()


def get_engine():

    DB_USER = os.getenv("DB_USER")
    DB_PASSWORD = os.getenv("DB_PASSWORD")
    DB_HOST = os.getenv("DB_HOST")
    DB_PORT = os.getenv("DB_PORT")
    DB_NAME = os.getenv("DB_NAME")


    DATABASE_URL = (
        f"mysql+pymysql://{DB_USER}:{DB_PASSWORD}"
        f"@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    )


    engine = create_engine(
        DATABASE_URL,
        echo=False
    )


    return engine
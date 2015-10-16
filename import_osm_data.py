# WORK IN PROGRESS

import json
import psycopg2


def get_connection_string():
    with open('db_config.json', 'r') as f:
        config = f.read()
    config_dict = json.loads(config)
    conn_string = "host='%s' dbname='%s' user='%s' password='%s'"\
                  % (config_dict['host'], config_dict['db_name'], config_dict['user'], config_dict['password'])
    return conn_string

if __name__ == "__main__":
    conn_string = get_connection_string()

    conn = psycopg2.connect(conn_string)

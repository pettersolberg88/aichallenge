#!/usr/bin/env python
import sys
import MySQLdb
import random

sys.path.append("../manager")
from server_info import server_info


if len(sys.argv) != 2:
  print "USAGE: python create_accounts.py num_accounts"
  sys.exit(1)
n = int(sys.argv[1])
connection = MySQLdb.connect(host = server_info["db_host"],
                             user = server_info["db_username"],
                             passwd = server_info["db_password"],
                             db = server_info["db_name"])
cursor = connection.cursor(MySQLdb.cursors.DictCursor)
for i in range(1, n + 1):
  username = "testbot" + str(i)
  country_id = str(random.randint(0, 20))
  org_id = str(random.randint(0, 20))
  cursor.execute("""
    INSERT INTO user
    (username,password,email,status_id,activation_code,org_id,bio,country_id,
      created,activated,admin)
    VALUES ('""" + username + """','no password','donotsend',1,'',
      """ + org_id + """,
      'I am a test bot controlled by the contest staff. Just ignore me!',
      """ + country_id + """,CURRENT_TIMESTAMP,1,0)
  """)
cursor.close()
connection.close()

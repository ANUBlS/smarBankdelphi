import cx_Oracle
import pandas as pd

host="172.10.20.11"
port="1521"
sid='pdbbokt'
user='smart'
password='oracledb'
sid = cx_Oracle.makedsn(host, port, service_name=sid)

connection = cx_Oracle.connect(user, password, sid, encoding="UTF-8")
data = pd.read_sql('SELECT * FROM ecxel_python', connection)
data.to_excel('D:/file.xlsx')  #called before closing the connection
connection.close()
from flask import Flask, request
import requests
import os

application = Flask(__name__)


@application.route('/hello')
def hello():
    return 'Hello there'


@application.route('/a', methods=['POST'])
def a():
    token = request.headers['Authorization']
    data = {"token": token}
    result =  requests.post('http://localhost:5001/auth').text
#    result = requests.post('http://app-b/auth', data=data).text
#   result = requests.post('http://0.0.0.0:5001/auth', data=data).text
    if result == "density":
        return 'Jobs:\nTitle: Devops\nDescription: Awesome\n'
    else:
        token = request.headers['Authorization']
        return '{} {} {}'.format('fail', token, result)

@application.route('/jobs', methods=['POST'])
def jobs():
    token = request.headers['Authorization']
    data = {"token": token}
    result = requests.post('http://app_b:5001/auth', data=data).text
##   result = requests.post('http://0.0.0.0:5001/auth', data=data).text
    if result == "density":
        return 'Jobs:\nTitle: Devops\nDescription: Awesome\n'
    else:
        token = request.headers['Authorization']
        return '{} {} {}'.format('fail', token, result)

@application.route('/b', methods=['POST'])
def b():
    ip = os.environ.get("NOMAD_ADDR_app_b")
    token = request.headers['Authorization']
    data = {"token": token}
    result = requests.post(f'http://{ip}/auth', data=data).text
##   result = requests.post('http://0.0.0.0:5001/auth', data=data).text
    if result == "density":
        return 'Jobs:\nTitle: Devops\nDescription: Awesome\n'
    else:
        token = request.headers['Authorization']
        return '{} {} {}'.format('fail', token, result)



#@application.route('/jobs2', methods=['POST'])
#def jobs2():
#    token = request.headers['Authorization']
#    data = {"token": token}
#   # result = requests.post('http://localhost:5001/auth', data=data).text
#   result = requests.post('http://0.0.0.0:5001/auth', data=data).text
#    if result == "density":
#        return 'Jobs:\nTitle: Devops\nDescription: Awesome\n'
#    else:
#        token = request.headers['Authorization']
#        return '{} {} {}'.format('fail', token, result)
#
#@application.route('/jobs3', methods=['POST'])
#def jobs3():
#    token = request.headers['Authorization']
#    data = {"token": token}
#    result = requests.post('http://app-b:5001/auth', data=data).text
###   result = requests.post('http://0.0.0.0:5001/auth', data=data).text
#    if result == "density":
#        return 'Jobs:\nTitle: Devops\nDescription: Awesome\n'
#    else:
#        token = request.headers['Authorization']
#        return '{} {} {}'.format('fail', token, result)
#
#
#
if __name__ == "__main__":
    application.run(host='0.0.0.0', port=5000)
#
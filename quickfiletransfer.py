import flask

app = flask.Flask(__name__)


@app.route('/<filename>',methods=['GET'])
def file_get(filename):
    return flask.send_from_directory('E:/2Semmasters/bhumi/task1',filename)

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=8080,debug=True)




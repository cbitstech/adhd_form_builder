from os import environ

from flask import send_from_directory
from eve import Eve

from settings import API_NAME

app = Eve(API_NAME)


@app.route('/scripts/<path:filename>')
def scripts(filename):
    return send_from_directory(app.root_path + '/dist/scripts/', filename)


@app.route('/styles/<path:filename>')
def styles(filename):
    return send_from_directory(app.root_path + '/dist/styles/', filename)


@app.route('/images/<path:filename>')
def images(filename):
    return send_from_directory(app.root_path + '/dist/images/', filename)


@app.route('/views/<path:filename>')
def views(filename):
    return send_from_directory(app.root_path + '/dist/views/', filename)


@app.route('/fonts/<path:filename>')
def fonts(filename):
    return send_from_directory(app.root_path + '/dist/fonts/', filename)


@app.route("/")
def index():
    return send_from_directory(app.root_path + '/dist/', 'index.html')


@app.route("/favicon.ico")
def favicon():
    return send_from_directory(app.root_path + '/dist/', 'favicon.ico')


def main(port=5000, host='127.0.0.1'):
    # Heroku support: bind to PORT if defined, otherwise default to 5000.
    if 'PORT' in environ:
        port = int(environ.get('PORT'))
        host = '0.0.0.0'
    app.run(host=host, port=port)

if __name__ == '__main__':
    main()

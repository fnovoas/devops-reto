from flask import Flask, jsonify, request
import datetime


app = Flask(__name__)


@app.route("/")
def home():
    """
    Ruta raíz.
    """
    return "¡Hola Mundo!"


@app.route("/status")
def status():
    """
    Ruta de estado que devuelve un JSON con status ok.
    Imprimir en consola las cabeceras de petición y respuesta.
    """
    # imprimir cabeceras de la petición
    print(request.headers)

    response = jsonify(status="ok")

    # imprimir cabeceras de la respuesta
    print(response.headers)

    return response


@app.route("/time")
def get_time():
    """
    Ruta que devuelve la hora UTC actual en ISO 8601.
    """
    now = datetime.datetime.utcnow().isoformat()
    return {"now": now}


if __name__ == "__main__":
    # Levanta el servidor en todas las interfaces en el puerto 5000
    app.run(host="0.0.0.0", port=5000, debug=True)

from flask import Flask, jsonify, request #importamos la función jsonify para respuestas JSON

app = Flask(__name__) #creamos la aplicación Flask diciendo el contexto el módulo actual

@app.route("/") #ruta HTTP GET en la raíz
def home():
    return "¡Hola Mundo!"

@app.route("/status")
def status():
    print(request.headers) #ver cabeceras de peticiones en la terminal
    response = jsonify(status="ok") #devolver un objeto JSON con el estado de la aplicación
    print(response.headers) #ver cabeceras de respuestas antes de enviar
    return response

@app.route("/time")
def time():
    import datetime
    return {"now": datetime.datetime.utcnow().isoformat()} #devolver la hora UTC actual dentro de un diccionario (se serializa a JSON)

if __name__ == "__main__": #punto de entrada de la aplicación
    app.run(host="0.0.0.0", port=5000, debug=True)
    #levanta el servidor de desarrollo de Flask
    #puerto 5000 para escuchar en todas las interfaces
    #debug=True activa recarga automática y muestra trazas de error detalladas
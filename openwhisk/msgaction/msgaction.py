def main(params):
    print ("Py msgaction params: " + str(params))

    for key in params["body"]:
        print(key, params["body"][key])

    return { "payload" :  "Hello " + str(params["body"]["text"]) + " from Python on OpenWhisk on OpenShift"}

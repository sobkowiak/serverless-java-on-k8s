function main(params) {
    console.log("JS msgaction args: %j", params);

    Object.keys(params["body"]).forEach(function (key) {
        console.log("%s: %j", key, params["body"][key])
    });

    return {payload: 'Hello ' + params.body.text + ' from JavaScript on OpenWhisk on Kubernetes '};
}

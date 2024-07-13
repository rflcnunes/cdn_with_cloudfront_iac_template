import FormHandler from "../../application/handlers/FormHandler"

const AppExampleCDN = {
    init: function (successCallback, errorCallback) {
        const formHandler = new FormHandler({
            onSuccess: successCallback,
            onError: errorCallback,
        })

        formHandler.init()
    },
}

export default AppExampleCDN

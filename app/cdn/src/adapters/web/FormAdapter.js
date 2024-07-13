import FormHandler from "../../application/handlers/FormHandler";

const AppExampleCDN = {
  init: function(successCallback, errorCallback) {
    new FormHandler({
      onSuccess: successCallback,
      onError: errorCallback
    });
  }
}

export default AppExampleCDN;
import IPService from "../../domain/services/IPService"
import APIClient from "../../infrastructure/http/ApiClient"

class FormHandler {
    constructor(config) {
        this.onSuccess = config.onSuccess
        this.onError = config.onError
        this.ipService = new IPService(new APIClient())
        this.ip = null
        this.init()
    }

    async init() {
        try {
            const ipInfo = await this.ipService.getIP()
            this.ip = ipInfo.ip
            this.onSuccess({ ip: this.ip })
        } catch (error) {
            console.error(
                "Error fetching IP on load:",
                error
            )
            this.onError()
        }
    }
}

export default FormHandler

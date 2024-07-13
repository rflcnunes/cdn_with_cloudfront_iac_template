class IPService {
    constructor(apiClient) {
        this.apiClient = apiClient
    }

    async getIP() {
        const response = await this.apiClient.get(
            "https://api.ipify.org?format=json"
        )

        if (response.ok) {
            return await response.json()
        } else {
            throw new Error("Failed to fetch IP.")
        }
    }
}

export default IPService

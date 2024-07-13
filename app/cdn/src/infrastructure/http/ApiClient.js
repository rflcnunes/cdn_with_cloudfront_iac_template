class ApiClient {
  async get(url) {
    return await fetch(url)
  }

  async post(url, options) {
    return await fetch(url, {
      method: 'POST',
      ...options
    })
  }
}

export default ApiClient

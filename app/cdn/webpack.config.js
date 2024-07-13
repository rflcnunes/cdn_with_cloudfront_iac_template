const path = require("path")

module.exports = {
    entry: "./src/main.js",
    output: {
        filename: "index.min.js",
        path: path.resolve(__dirname, "dist"),
    },
}

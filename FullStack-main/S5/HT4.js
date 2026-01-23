const fs = require('node:fs')
const http = require('node:http')

const hostname = '127.0.0.1'
const port = 5001
const filename = './HT4-counter.txt'

const server = http.createServer((req, res) => {
    console.log(req.url)
    fs.readFile(filename, (err, data) => {
        if (err) {
            console.log(err)
            res.statusCode = 500
            res.end()
        }
        else {
            let count = Number(data.toString()) + 1
            fs.writeFile(filename, count+'', (error) => {
                if (error) {
                    res.statusCode = 500
                    res.end()
                } else {
                    res.statusCode = 200
                    res.setHeader('Content-Type', 'text/html')
                    res.end(`<p>Visitors: ${count} </p>`)
                }
            })
        }
    })
})

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}...`)
})
const fs = require('node:fs')

const sum = (array) => {
    let total = 0
    for (value of array) {
        total = total + Number(value)
    }
    return total
}

fs.readFile('HT3nmbr.txt', (err, data) => {
    if (err) console.log(err)
    else {
        let array = data.toString().split(',')
        console.log(sum(array))
    }
})
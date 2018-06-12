const mysql = require('mysql')

function runSql(sql, callback) {
    console.log('runSql Invoked')

    const config = {
        host     : process.env.MYSQL_HOST,
        user     : process.env.MYSQL_USER || 'londontubeuser',
        password : process.env.MYSQL_PASSWORD,
        database : process.env.MYSQL_DB || 'londontubes'
    }
    console.log(config)

    const connection = mysql.createConnection(config)

    console.log(sql)
    connection.query(sql, (err, rows) => {
        connection.end()
        
        if (err) {
            console.log(err)
            callback(null, {
                statusCode: 500,
                body: 'Failed Running Query'
            })
            return
        }

        console.log(rows)
        callback(null, {
            statusCode: 200,
            headers: { 'content-type': 'application/json', 'Access-Control-Allow-Origin': '*' },
            body: JSON.stringify(rows[0])
        })
    })
} 

exports.handler = (event, context) => {
    event.Records.forEach(function(record) {
        var payload = JSON.parse(new Buffer(record.kinesis.data, 'base64').toString('ascii'))
        console.log(payload)
        runSql(`call score_target(${payload.playerId}, '${payload.name}', '${payload.timestamp}');`, context.done)
    })
}

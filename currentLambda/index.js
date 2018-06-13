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
        if (err) {
            console.log(err)
            callback(null, {
                statusCode: 500,
                body: 'Failed Running Query'
            })

            connection.end()
            return
        }

        connection.end()
        
        callback(null, {
            statusCode: 200,
            headers: { 'content-type': 'application/json', 'Access-Control-Allow-Origin': '*' },
            body: JSON.stringify(rows[0])
        })
    })
} 

exports.handler = (event, context) => {
    runSql(`select * from current_target`, context.done)
}

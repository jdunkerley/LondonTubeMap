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
            headers: { 'content-type': 'application/json' },
            body: JSON.stringify(rows)
        })
    })
} 

exports.handler = (event, context) => {
    console.log(context)
    console.log(event)

    if (context.identity) {
        runSql(`call new_target()`, context.done)
    } else if (event.pathParameters && event.pathParameters.x && event.pathParameters.y) {
        runSql(`call target_distance(${event.pathParameters.x}, ${event.pathParameters.y})`, context.done)
    } else if ((event.path || '').endsWith('current')) {
        runSql(`select * from current_target`, context.done)
    } else {
        runSql(`select * from stations`, context.done)
    }
}

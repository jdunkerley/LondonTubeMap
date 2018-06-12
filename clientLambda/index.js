const mysql = require('mysql')
const AWS = require('aws-sdk')

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
            body: JSON.stringify(rows)
        })
    })
} 

exports.handler = (event, context) => {
    console.log(context)
    console.log(event)

    if (event.pathParameters && event.pathParameters.x && event.pathParameters.y) {
        runSql(`call target_distance(${event.pathParameters.x}, ${event.pathParameters.y})`, (_, response) => {
            if (response.statusCode === 200 && event.queryStringParameters && event.queryStringParameters.playerId) {
                const body = JSON.parse(response.body)[0][0]
                response.body = JSON.stringify(JSON.parse(response.body)[0])
                if (body.DIST < 100) {
                    const kinesis = new AWS.Kinesis({apiVersion: '2013-12-02', region: process.env.KINESIS_REGION})
                    kinesis.putRecord({
                        Data: JSON.stringify({...body, playerId: event.queryStringParameters.playerId, timestamp: new Date().toISOString().substr(0,19).replace('T', ' ') }),
                        PartitionKey: `message-${Math.floor(Math.random() * 1000000)}`,
                        StreamName: process.env.KINESIS_STREAM
                    }, (err, data) => {
                        if (err) {
                            console.log('Kinesis Fail')
                            console.log(err)
                            context.done(null, response)
                            return
                        }

                        console.log('Kinesis OK!')
                        console.log(data)
                        context.done(null, response)
                    })

                    return
                }
            } else if (response.statusCode === 200) {
                response.body = JSON.stringify(JSON.parse(response.body)[0])
            }

            context.done(null, response)
        })
    } else if ((event.path || '').endsWith('current')) {
        runSql(`select * from current_target`, (_, response) => {
            if (response.statusCode === 200) {
                response.body = JSON.stringify(JSON.parse(response.body)[0])
            }
            context.done(null, response)
        })
    } else if ((event.path || '').endsWith('score')) {
        runSql(`select * from current_scores`, context.done)
    } else {
        runSql(`select * from stations`, context.done)
    }
}

const React = require('react')

class Index extends React.Component {
    constructor(props) {
        super(props)
        this.svgObject = React.createRef()
        this.width = 600
        this.ws = null
        this.playerId = 0
        this.sessionId = Math.random()*1000000
        this.otherPlayes = []
    }

    render = () => {
        return <div>
            <object type="image/svg+xml" data="/static/tubemap.svg" ref={this.svgObject} onLoad={this.svgObjectLoad} onKeyPress={this.handleKeyPress}>
                Your browser does not support SVG
            </object>
        </div>
    }

    handleKeyPress = (ev) => {
        //console.log(`keypress ${ev.key}`)
        if (ev.key === 'ArrowUp') {
            this.svgMoveViewPort(0, -10)
        } else if (ev.key === 'ArrowDown') {
            this.svgMoveViewPort(0, 10)
        } else if (ev.key === 'ArrowLeft') {
            this.svgMoveViewPort(-10, 0)
        } else if (ev.key === 'ArrowRight') {
            this.svgMoveViewPort(10, 0)
        }
    }

    svgGetViewport= () => {
        const svg = this.svgObject.current.contentDocument.querySelector('svg')
        let viewbox = svg.getAttribute('viewBox')
        let dim = (viewbox || '').split(' ').map(parseFloat)
        if (!this.minX) {
            this.minX = dim[0]
            this.minY = dim[1]
            this.maxX = dim[2] + dim[0]
            this.maxY = dim[3] + dim[1]
            console.log(this)
        }
        return dim
    }

    svgObjectLoad = () => {
        console.log('svgObjectLoad')
        this.resizeSVG()
    }

    svgMoveViewPort = (moveX, moveY) => {
        //console.log('svgMoveViewPort')

        let dim = this.svgGetViewport()
        if (dim[0] + moveX < this.minX) moveX = dim[0] - this.minX
        if (dim[1] + moveY < this.minY) moveY = dim[1] - this.minY
        if (dim[0] + dim[2] + moveX > this.maxX) moveX = this.maxX - dim[0] - dim[2]
        if (dim[1] + dim[3] + moveY > this.maxY) moveY = this.maxY - dim[1] - dim[3]

        const svg = this.svgObject.current.contentDocument.querySelector('svg')
        svg.setAttribute('viewBox', `${dim[0] + moveX} ${dim[1] + moveY} ${dim[2]} ${dim[3]}`)

        // Eval closeness to target
        // Post back to AWS Kinesis

        //sent back positon to websocket
        let message = {}
        message.otherPlayerId = this.playerId
        message.dim = dim
        this.ws.send(JSON.stringify(message))
    }

    resizeSVG = () => {
        console.log('resizeSVG')
        const current = this.svgObject.current

        current.height = window.innerHeight - 50
        current.width = window.innerWidth - 50
        const bBox = [current.width, current.height]

        const svg = current.contentDocument.querySelector('svg')
        if (svg) {
            let dim = this.svgGetViewport()
            svg.setAttribute('viewBox', `${dim[0]} ${dim[1]} ${this.width} ${this.width * bBox[1] / bBox[0]}`)
            console.log(svg.getAttribute('viewBox'))
        }

        this.gamma = undefined
    }

    componentDidMount = () => {
        window.addEventListener('resize', this.resizeSVG)
        this.resizeSVG()

        if (window.DeviceOrientationEvent) {
            window.addEventListener('deviceorientation', (ev) => {
                if (!this.gamma) {
                    this.beta = ev.beta
                    this.gamma = ev.gamma
                }

                if (ev.gamma - this.gamma > 10) this.svgMoveViewPort(5 + (ev.gamma - this.gamma) / 80 * 20, 0)
                if (ev.gamma - this.gamma < -10) this.svgMoveViewPort(-5 + (ev.gamma - this.gamma) / 80 * 20, 0)
                if (ev.beta - this.beta > 10) this.svgMoveViewPort(0, -(5 + (ev.beta - this.beta) / 80 * 20))
                if (ev.beta - this.beta < -10) this.svgMoveViewPort(0, -(-5 + (ev.beta - this.beta) / 80 * 20))
            })
         }
        window.addEventListener('keydown', this.handleKeyPress)

        //setting up websocket
        this.ws = new WebSocket("ws://localhost:7070/game/" + this.sessionId)
        this.ws.onopen = event => {
            console.log('connection established')
        }
        this.ws.onmessage = messageEvent => {
            console.log("got message: "+messageEvent.data)
            let messageJSON = JSON.parse(messageEvent.data)
            if(messageJSON.playerId){
                console.log("setting playerId: "+messageJSON.playerId)
                this.playerId = messageJSON.playerId
            }
            if(messageJSON.otherPlayerId){           
                console.log("drawing player: "+messageJSON.otherPlayerId)
                if(this.otherPlayes[messageJSON.otherPlayerId]) {
                    this.otherPlayes[messageJSON.otherPlayerId].remove()
                }
                var svgns = "http://www.w3.org/2000/svg"
                const current = this.svgObject.current
                const svg = current.contentDocument.querySelector('svg')
                var shape = document.createElementNS(svgns, "circle")
                shape.setAttributeNS(null, "cx", messageJSON.dim[0])
                shape.setAttributeNS(null, "cy", messageJSON.dim[1])
                shape.setAttributeNS(null, "r",  20)
                shape.setAttributeNS(null, "fill", "green")
                svg.appendChild(shape)
                this.otherPlayes[messageJSON.otherPlayerId]=shape
            }
        }
        this.ws.onerror = event => {
            console.log("error: "+event)
        }
        this.ws.onclose = closeEvent => {
            console.log('connection closed')
        }
    }

    componentWillUnmount = () => {
    }
}

export default Index
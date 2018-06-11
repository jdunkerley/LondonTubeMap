const React = require('react')
const config = require('../appconfig.js').default

class Index extends React.Component {
  constructor(props) {
    super(props)
    this.svgObject = React.createRef()
    this.width = 600
    this.ws = null
    this.wsConnected = false
    this.playerId = 0
    this.sessionId = Math.random() * 1000000
    this.otherPlayes = []
    this.fetchInprogress = false
  }

  render = () => {
    return <div>
      <object type="image/svg+xml" data="/static/tubemap.svg" ref={this.svgObject} onLoad={this.svgObjectLoad} onKeyPress={this.handleKeyPress}>
        Your browser does not support SVG
            </object>
    </div>
  }

  handleKeyPress = (ev) => {
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

  svgCreateCircle = (x, y, r = 5, stroke = 'black', fill = 'none') => {
    const svg = this.svgObject.current.contentDocument.querySelector('svg')
    if (!svg) return null

    const svgns = "http://www.w3.org/2000/svg"
    const shape = document.createElementNS(svgns, "circle")
    shape.setAttributeNS(null, "cx", x)
    shape.setAttributeNS(null, "cy", y)
    shape.setAttributeNS(null, "r", r)
    if (stroke) shape.setAttributeNS(null, "stroke", stroke)
    if (fill) shape.setAttributeNS(null, "fill", fill)

    svg.appendChild(shape)

    return shape
  }

  svgGetViewport = () => {
    const svg = this.svgObject.current.contentDocument.querySelector('svg')
    let viewbox = svg.getAttribute('viewBox')
    let dim = (viewbox || '').split(' ').map(parseFloat)
    if (!this.minX) {
      this.minX = dim[0]
      this.minY = dim[1]
      this.maxX = dim[2] + dim[0]
      this.maxY = dim[3] + dim[1]
    }
    return dim
  }

  svgObjectLoad = () => {
    console.log('svgObjectLoad')
    this.resizeSVG()
  }

  svgMoveViewPort = (moveX, moveY) => {
    let dim = this.svgGetViewport()
    if (dim[0] + moveX < this.minX) moveX = this.minX - dim[0]
    if (dim[1] + moveY < this.minY) moveY = this.minY - dim[1]
    if (dim[0] + dim[2] + moveX > this.maxX) moveX = this.maxX - dim[0] - dim[2]
    if (dim[1] + dim[3] + moveY > this.maxY) moveY = this.maxY - dim[1] - dim[3]

    const svg = this.svgObject.current.contentDocument.querySelector('svg')
    svg.setAttribute('viewBox', `${dim[0] + moveX} ${dim[1] + moveY} ${dim[2]} ${dim[3]}`)

    const xyArray = [dim[0] + moveX + dim[2] / 2, dim[1] + moveY + dim[3] / 2]
    if (this.playerCircle) {
      this.playerCircle.setAttributeNS(null, "cx", xyArray[0])
      this.playerCircle.setAttributeNS(null, "cy", xyArray[1])
    } else {
      this.playerCircle = this.svgCreateCircle(xyArray[0], xyArray[1], 5, "black")
    }

    // Eval closeness to target
    if (!this.fetchInprogress) {
      this.fetchInprogress = true
      window.fetch(`${config.lambda}${xyArray[0]}/${xyArray[1]}`, { mode: 'no-cors' })
        .then((body) => {
          this.fetchInprogress = false
          console.log(body)
        })
        .catch((error) => {
          this.fetchInprogress = false
          console.error(error)
          if (this.playerCircle) {
            this.playerCircle.setAttributeNS(null, "stroke", "black")
          }
        })
    }

    //sent back positon to websocket
    if (this.wsConnected) this.ws.send(JSON.stringify({
      otherPlayerId: this.playerId,
      dim: xyArray
    }))
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
      this.svgMoveViewPort(0,0)
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
    console.log(config)
    this.ws = new WebSocket(config.websocket + this.sessionId)
    this.ws.onopen = event => {
      console.log('connection established')
      this.wsConnected = true
    }
    this.ws.onmessage = messageEvent => {
      console.log("got message: " + messageEvent.data)
      let messageJSON = JSON.parse(messageEvent.data)
      if (messageJSON.playerId) {
        console.log("setting playerId: " + messageJSON.playerId)
        this.playerId = messageJSON.playerId
      }
      if (messageJSON.otherPlayerId) {
        console.log("drawing player: " + messageJSON.otherPlayerId)
        
        if (this.otherPlayes[messageJSON.otherPlayerId]) {
          this.otherPlayes[messageJSON.otherPlayerId].setAttributeNS(null, "cx", messageJSON.dim[0])
          this.otherPlayes[messageJSON.otherPlayerId].setAttributeNS(null, "cy", messageJSON.dim[1])
        } else {
          this.otherPlayes[messageJSON.otherPlayerId] = this.svgCreateCircle(messageJSON.dim[0], messageJSON.dim[1], 10, "none", "grey")
        }
      }
    }
    this.ws.onerror = event => {
      console.log("error: " + event)
    }
    this.ws.onclose = closeEvent => {
      console.log('connection closed')
      this.wsConnected = false
    }
  }

  componentWillUnmount = () => {
  }
}

export default Index
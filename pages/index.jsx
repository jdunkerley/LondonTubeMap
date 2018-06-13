import Head from 'next/head'
const React = require('react')
const config = require('../appconfig.js').default

class Index extends React.Component {
  constructor(props) {
    super(props)
    this.svgObject = React.createRef()
    this.state = {message: 'Target Unknown', playerId: 0}
    this.width = 600
    this.ws = null
    this.wsConnected = false
    this.sessionId = Math.random() * 1000000
    this.otherPlayes = []
    this.fetchInprogress = false
  }

  render = () => {
    return <div>
      <Head>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta charSet="utf-8" />
      </Head>
      <div style={{height: '60px'}}><h1>Plr {this.state.playerId} - {this.state.message}</h1></div>
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

    const svgns = 'http://www.w3.org/2000/svg'
    const shape = document.createElementNS(svgns, 'circle')
    shape.setAttributeNS(null, 'cx', x)
    shape.setAttributeNS(null, 'cy', y)
    shape.setAttributeNS(null, 'r', r)
    if (stroke) shape.setAttributeNS(null, 'stroke', stroke)
    if (fill) shape.setAttributeNS(null, 'fill', fill)
    shape.setAttributeNS(null, 'fill-opacity', '0.5')
    shape.setAttributeNS(null, 'stroke-width', '2')

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
    if (dim[0] + moveX < (this.minX - dim[2] / 2)) moveX = (this.minX - dim[2] / 2) - dim[0]
    if (dim[1] + moveY < (this.minY - dim[3] / 2)) moveY = (this.minY - dim[3] / 2) - dim[1]
    if (dim[0] + dim[2] + moveX > (this.maxX + dim[2] / 2)) moveX = (this.maxX + dim[2] / 2) - dim[0] - dim[2]
    if (dim[1] + dim[3] + moveY > (this.maxY + dim[3] / 2)) moveY = (this.maxY + dim[3] / 2) - dim[1] - dim[3]

    const svg = this.svgObject.current.contentDocument.querySelector('svg')
    svg.setAttribute('viewBox', `${dim[0] + moveX} ${dim[1] + moveY} ${dim[2]} ${dim[3]}`)

    const xyArray = [dim[0] + moveX + dim[2] / 2, dim[1] + moveY + dim[3] / 2]
    if (this.playerCircle) {
      this.playerCircle.setAttributeNS(null, 'cx', xyArray[0])
      this.playerCircle.setAttributeNS(null, 'cy', xyArray[1])
    } else {
      this.playerCircle = this.svgCreateCircle(xyArray[0], xyArray[1], 10, 'black')
    }

    // Eval closeness to target
    if (!this.fetchInprogress) {
      this.fetchInprogress = true
      fetch(`${config.lambda}${xyArray[0]}/${xyArray[1]}?playerId=${this.state.playerId}`, { mode: 'cors' })
        .then((response) => {
          this.fetchInprogress = false
          response.json().then(t => { 
            const row = t[0]
            this.playerCircle.setAttributeNS(null, 'fill', (row.rank < 5 ? 'red' : (row.rank < 15 ? 'orange' : (row.rank < 40 ? 'yellow' : 'none'))))
            this.setState(ps => { return { message: `${row.name} ${row.DIST < 100 ? 'HIT' : ''}`, playerId: ps.playerId } })
          })
        })
        .catch((error) => {
          this.fetchInprogress = false
          console.error(error)
          if (this.playerCircle) {
            this.playerCircle.setAttributeNS(null, 'fill', 'none')
          }
        })
    }

    //sent back positon to websocket
    if (this.wsConnected) this.ws.send(JSON.stringify({
      otherPlayerId: this.state.playerId,
      dim: xyArray
    }))
  }

  resizeSVG = () => {
    console.log('resizeSVG')
    const current = this.svgObject.current

    current.height = window.innerHeight - 90
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

        if (ev.gamma - this.gamma > 10) this.svgMoveViewPort(2 + Math.floor((ev.gamma - this.gamma) / 10) * 5, 0)
        if (ev.gamma - this.gamma < -10) this.svgMoveViewPort(-2 + Math.floor((ev.gamma - this.gamma) / 10) * 5, 0)
        if (ev.beta - this.beta > 10) this.svgMoveViewPort(0, -(2 + Math.floor((ev.beta - this.beta) / 10) * 5))
        if (ev.beta - this.beta < -10) this.svgMoveViewPort(0, -(-2 + Math.floor((ev.beta - this.beta) / 10) * 5))
      })
    }
    window.addEventListener('keydown', this.handleKeyPress)

    //setting up websocket
    console.log(config)
    this.ws = new WebSocket(config.websocket + this.sessionId)
    this.ws.onopen = event => {
      console.log('WS connection established')
      this.wsConnected = true
    }
    this.ws.onmessage = messageEvent => {
      console.log(`WS message: ${messageEvent.data}`)
      let messageJSON = JSON.parse(messageEvent.data)
      if (messageJSON.playerId) {
        console.log(`WS setting playerId: ${messageJSON.playerId}`)
        this.setState(ps => { return { playerId: messageJSON.playerId, message: ps.message } })
      }
      if (messageJSON.otherPlayerId) {
        console.log(`WS drawing player: ${messageJSON.otherPlayerId}`)
        
        if (this.otherPlayes[messageJSON.otherPlayerId]) {
          this.otherPlayes[messageJSON.otherPlayerId].setAttributeNS(null, 'cx', messageJSON.dim[0])
          this.otherPlayes[messageJSON.otherPlayerId].setAttributeNS(null, 'cy', messageJSON.dim[1])
        } else {
          this.otherPlayes[messageJSON.otherPlayerId] = this.svgCreateCircle(messageJSON.dim[0], messageJSON.dim[1], 10, 'darkgreen', 'green')
        }
      }
    }
    this.ws.onerror = event => {
      console.log(`WS error: ${event}`)
    }
    this.ws.onclose = closeEvent => {
      console.log('connection closed')
      this.wsConnected = false
    }
  }
}

export default Index
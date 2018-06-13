import Head from 'next/head'
const React = require('react')
const config = require('../appconfig.js').default

class Admin extends React.Component {
  constructor(props) {
    super(props)
    this.svgObject = React.createRef()
  }

  render = () => {
    return <div>
      <Head>
        <link rel="stylesheet" type="text/css" href="/static/admin.css" media="screen" />
      </Head>
      <h1>London Tube Race</h1>
      <img alt="QR Code" src="/static/qrCode.png" style={{margin: '0 auto'}} />
      <svg width="100%" height="500px" ref={this.svgObject}></svg>
      
      <script src="https://d3js.org/d3.v4.min.js"></script>
    </div>
  }

  componentDidMount = () => {
    const 
      svg = d3.select("svg"),
      margin = { top: 20, right: 20, bottom: 30, left: 40 },
      x = d3.scaleBand().padding(0.1),
      y = d3.scaleLinear();
    let theData = undefined

    const g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")")
    g.append("g").attr("class", "axis axis--x")
    g.append("g").attr("class", "axis axis--y")
    g.append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", "0.71em")
      .attr("text-anchor", "end")
      .text("Frequency");

    // DRAWING
    function draw() {
      const 
        bounds = svg.node().getBoundingClientRect(),
        width = bounds.width - margin.left - margin.right,
        height = bounds.height - margin.top - margin.bottom

      x.rangeRound([0, width])
      y.rangeRound([height, 0])

      g.select(".axis--x").attr("transform", "translate(0," + height + ")").call(d3.axisBottom(x))
      g.select(".axis--y").call(d3.axisLeft(y).ticks(10, "%"))

      const bars = g.selectAll(".bar").data(theData);

      // ENTER
      bars
        .enter()
        .append("rect")
        .attr("class", "bar")
        .attr("x", (d) => x(d.player) )
        .attr("y", (d) => y(d.score) )
        .attr("width", x.bandwidth())
        .attr("height", (d) => (height - y(d.score)) )

      // UPDATE
      bars
        .attr("x", (d) => x(d.player) )
        .attr("y", (d) => y(d.score) )
        .attr("width", x.bandwidth())
        .attr("height", (d) => (height - y(d.score)) )

      // EXIT
      bars
        .exit()
        .remove()
    }

    // LOADING DATA
    function loadData() {
      fetch(`${config.lambda}score`, { mode: 'cors' })
      .then((response) => {
        response.json().then(t => { 
          theData = t.map(r => { return { player: `Player ${r.playerId}`, score: r.score} })
          x.domain(theData.map((d) => d.player))
          y.domain([0, d3.max(theData, (d) => d.score)])
          draw()

          setTimeout(loadData, 1000)
        })
      })
      .catch((error) => {
        console.error(error)
      })
    }

    // START!
    window.addEventListener("resize", draw)
    loadData()
  }
}

export default Admin
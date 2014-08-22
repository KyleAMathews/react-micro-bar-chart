React = require 'react'
d3 = require 'd3'

module.exports = React.createClass

  getDefaultProps: ->
    return {
      width: 100
      height: 16
      fillColor: 'black'
      data: [7,1,5,5,4,3,5,2,3,5,6] # Some semi-random data.
    }

  componentDidMount: ->
    @renderBarChart()

  render: ->
    <svg />

  renderBarChart: ->
    values = @props.data.slice()

    y = d3.scale.linear()
      .range([@props.height, 0])
    y.domain([0, Math.max.apply(null, values)])

    chart = d3.select(@getDOMNode())
        .attr("width", @props.width)
        .attr("height", @props.height)

    barWidth = @props.width / values.length

    bar = chart.selectAll("g")
        .data(values)
      .enter().append("g")
        .attr("transform", (d, i) -> return "translate(" + i * barWidth + ",0)")

    bar.append("rect")
        .attr("y", (d) -> return y(d))
        .attr("height", (d) => console.log(d, y(d)); return @props.height - y(d))
        .attr("width", barWidth - 1)
        .attr("fill", @props.fillColor)

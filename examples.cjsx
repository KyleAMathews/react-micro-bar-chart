React = require('react')
Table = require 'react-simple-table'
faker = require 'faker'
MicroBarChart = require '../src/index'

columns = ['apple', 'peach', {
  displayName: 'activity'
  function: (data) -> <MicroBarChart data={data.data} />
}]

data = for i in [0..5]
  {
    apple: faker.Lorem.words(1)
    peach: faker.Lorem.words(1)
    data: for i in [0..7]
      faker.Helpers.randomNumber(200)
  }

module.exports = React.createClass
  render: ->
    <div style={width:'500px', margin:'0 auto'}>
      <h1>React-Micro-Bar-Chart</h1>
      <a href="https://github.com/KyleAMathews/react-micro-bar-chart">Code on Github</a>
      <br />
      <br />

      <h2>Default look</h2>
      <pre><code>
      {"""
      <MicroBarChart />
        """}
      </code></pre>
      <MicroBarChart />
      <br />
      <br />
      <br />

      <h2>Override all options</h2>
      <pre><code>
      {"""
      <MicroBarChart
        width=200
        height=50
        fillColor="steelblue" />
        """}
      </code></pre>
      <MicroBarChart
        width=200
        height=50
        fillColor="steelblue" />
      <br />
      <br />
      <br />

      <h2>Use in table</h2>
      <Table columns={columns} data={data} />
      <br />
      <br />
      <br />
      <br />

    </div>

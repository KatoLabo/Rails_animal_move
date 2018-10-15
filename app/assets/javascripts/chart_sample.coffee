window.draw_graph = ->
  ctx = document.getElementById("myChart").getContext('2d')
  barNum = 7
  labels = new Array(barNum)
  bgColors = new Array(barNum)
  bdColors = new Array(barNum)
  for i in [0...barNum]
    labels[i] = 'data' + i
    bgColors[i] = 'rgba(75, 192, 192, 0.2)'
    bdColors[i] = 'rgba(75, 192, 192, 1)'
  myChart = new Chart(ctx, {
    type: 'line',
    data: {
      datasets: [{
        label: '# Clean Level',
        data: gon.data,
        backgroundColor: bgColors,
        borderColor: bdColors,
        lineTension: 0,
        borderWidth: 1
      }],
      labels: labels,
    },
    options: {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero:true
          }
        }]
      }
    }
  })
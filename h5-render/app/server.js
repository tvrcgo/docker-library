
const express = require('express')
const app = express()

app.set('port', process.env.PORT || 3000)

app.use(express.static(__dirname + '/web'))

app.get('/', (req, res) => {
  res.type('html')
  res.render('web/index.html')
})

app.listen(app.get('port'), () => {
  console.log('h5-render server start at %s.', `localhost:${app.get('port')}`)
})

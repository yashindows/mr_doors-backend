import express, { json, response } from 'express'
import mysql from 'mysql'
import cors from 'cors'
import jwt from 'jsonwebtoken'
import bcrypt from 'bcrypt'
import cookieParser from 'cookie-parser'
const salt = 10

const app = express()
const port = process.env.port || 3000
app.use(express.json())
app.use(cookieParser())

app.use(
  cors({
    origin: ['http://localhost:5173'],
    methods: ['POST', 'GET'],
    credentials: true,
  })
)

const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'mr_doors',
})

const verifyUser = (req, res, next) => {
  const token = req.cookies.token
  if (!token) {
    return res.json({ Error: 'You are not authenticated' })
  } else {
    jwt.verify(token, 'jwt-secret-key', (err, decoded) => {
      if (err) {
        return res.json({ Error: 'Token isnt ok' })
      } else {
        req.name = decoded.name
        next()
      }
    })
  }
}

app.get('/', verifyUser, (req, res) => {
  return res.json({
    Status: 'Success',
    name: req.name,
  })
})

app.get('/products', (req, res) => {
  const chooseProducts = 'SELECT * FROM `products` WHERE `product_id` > 3'
  db.query(chooseProducts, (err, data) => {
    if (err) {
      console.log(err)
    } else {
      res.json(data)
    }
  })
})

app.get('/kitchens', (req, res) => {
  const chooseKitchen =
    'SELECT * FROM products WHERE product_category = "Столовые"'
  db.query(chooseKitchen, (err, data) => {
    if (err) {
      console.log(err)
    } else {
      res.json(data)
    }
  })
})

app.get('/living-rooms', (req, res) => {
  const chooseKitchen =
    'SELECT * FROM products WHERE product_category = "Жилые зоны"'
  db.query(chooseKitchen, (err, data) => {
    if (err) {
      console.log(err)
    } else {
      res.json(data)
    }
  })
})

app.get('/bedrooms', (req, res) => {
  const chooseKitchen =
    'SELECT * FROM products WHERE product_category = "Спальни"'
  db.query(chooseKitchen, (err, data) => {
    if (err) {
      console.log(err)
    } else {
      res.json(data)
    }
  })
})

app.get('/favorite', (req, res) => {
  const chooseKitchen = 'SELECT * FROM products WHERE product_in_favorite = 1'
  db.query(chooseKitchen, (err, data) => {
    if (err) {
      console.log(err)
    } else {
      res.json(data)
    }
  })
})

app.post('/add-favorite/product/:id', (req, res) => {
  const addToCart = `UPDATE products SET product_in_favorite = 1 WHERE products.product_id = ${req.params.id}`
  db.query(addToCart)
})
app.post('/delete-favorite/product/:id', (req, res) => {
  const deleteFromCart = `UPDATE products SET product_in_favorite = 0 WHERE products.product_id = ${req.params.id}`
  db.query(deleteFromCart)
})

app.get('/product/:id', (req, res) => {
  const chooseProduct = `SELECT * FROM products WHERE product_id = ${req.params.id}`
  db.query(chooseProduct, (err, data) => {
    if (err) {
      console.log(err)
    } else {
      res.json(data)
    }
  })
})

app.get('/preview', (req, res) => {
  const showProducts =
    'SELECT * FROM `products` WHERE `product_recommended`=1 AND `product_id` > 3'
  db.query(showProducts, (err, data) => {
    if (err) {
      console.log(err)
    } else {
      res.json(data)
    }
  })
})

app.get('/users', (req, res) => {
  const showUsers = 'SELECT * FROM `users`'
  db.query(showUsers, (err, data) => {
    if (err) {
      console.log('error:' + err)
    } else {
      res.json(data)
    }
  })
})

app.post('/add/product/:id', (req, res) => {
  const addToCart = `UPDATE products SET product_in_cart = 1, product_amount = ${
    req.body.amount === undefined ? (req.body.amount = 1) : req.body.amount
  } WHERE products.product_id = ${req.params.id}`
  db.query(addToCart)
})
app.post('/delete/:id', (req, res) => {
  const deleteFromCart = `UPDATE products SET product_in_cart = 0, product_amount = 0 WHERE products.product_id = ${req.params.id}`
  db.query(deleteFromCart)
})

app.get('/in-cart', (req, res) => {
  const showProducts = 'SELECT * FROM `products` WHERE `product_in_cart` = 1'
  db.query(showProducts, (err, data) => {
    if (err) {
      console.log(err)
    } else {
      res.json(data)
    }
  })
})

app.post('/register', (req, res) => {
  const createUser =
    'INSERT INTO `users` (`user_login`, `user_password`) VALUES(?)'
  bcrypt.hash(req.body.password.toString(), salt, (err, hash) => {
    if (err) {
      res.json({ Error: 'Error for hashing password' })
    }
    const values = [req.body.login, hash]
    db.query(createUser, [values], (err, result) => {
      if (err) {
        res.json({ Error: 'Inserting data Error in server' })
      }
      res.json({ Status: 'Success' })
    })
  })
})

app.post('/login', (req, res) => {
  const sql = 'SELECT * FROM `users` WHERE user_login = ?'
  db.query(sql, [req.body.login], (err, data) => {
    if (err) {
      res.json({ Error: 'Login error in server' })
    }
    if (data.length > 0) {
      bcrypt.compare(
        req.body.password.toString(),
        data[0].user_password,
        (err, response) => {
          if (err) {
            return res.json({ Error: 'Password compare error' })
          }
          if (response) {
            const name = data[0].user_login
            const token = jwt.sign({ name }, 'jwt-secret-key', {
              expiresIn: '1d',
            })
            res.cookie('token', token)
            return res.json({ Status: 'Success' })
          } else {
            return res.json({ Error: 'Password doesnt match' })
          }
        }
      )
    } else {
      return res.json({ Error: 'No login exist' })
    }
  })
})

app.get('/logout', (req, res) => {
  res.clearCookie('token')
  return res.json({ Status: 'Success' })
})

app.listen(port, () => {
  console.log('listening port: ' + port)
})

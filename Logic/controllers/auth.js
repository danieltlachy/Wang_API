const { response } = require('express');
const { pool, poolConnect, sql } = require('../../business/models/database');
const jwt = require("jsonwebtoken");
const bcrypt = require("bcryptjs");
require("dotenv").config();

const generateTokens = (payload) => ({
  accessToken: jwt.sign(payload, process.env.JWT_SECRET, {
    expiresIn: process.env.JWT_EXPIRES_IN,
  }),
  refreshToken: jwt.sign(payload, process.env.JWT_REFRESH_SECRET, {
    expiresIn: process.env.JWT_REFRESH_EXPIRES_IN,
  }),
});

const getUserByEmail = async (email) => {
  await poolConnect;
  const request = pool.request();
  request.input('Email', sql.VarChar(100), email);
  const query = "SELECT * FROM Accounts WHERE Email = @Email AND IsActive = 1";
  const result = await request.query(query);
  return result.recordset[0];
};


const verifyAndRefreshToken = (refreshToken, callback) => {
  jwt.verify(refreshToken, process.env.JWT_REFRESH_SECRET, callback);
};

const login = async (req, res = response) => {
  const { email, password } = req.body;
  if (!email || !password)
    return res.status(400).json({ error: 'Faltan campos obligatorios' });

  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  const passwordRegex = /^[a-zA-Z0-9!@#$%^&*]{6,}$/;

  if (!emailRegex.test(email)) {
    return res.status(400).json({ error: '¡Error! El formato del correo electrónico es inválido' });
  }

  if (!passwordRegex.test(password)) {
    return res.status(400).json({ error: '¡Error! La contraseña debe tener al menos 6 caracteres y solo contener letras, números o símbolos !@#$%^&*' });
  }

  try {
    const user = await getUserByEmail(email);
    if (!user) return res.status(400).json({ error: 'Credenciales inválidas' });

    const isMatch = await bcrypt.compare(password, user.Password);
    if (!isMatch) return res.status(400).json({ error: 'Credenciales inválidas' });

    const payload = { id: user.AccountID, role: user.Role };
    const tokens = generateTokens(payload);
    return res.json(tokens);

  } catch (error) {
    console.error('Error en login:', error);
    return res.status(500).json({ error: 'Error interno del servidor' });
  }
};

const refreshToken = (req, res = response) => {
  const { refreshToken } = req.body;
  if (!refreshToken)
    return res.status(401).json({ error: 'Token de refresco requerido' });

  try {
    verifyAndRefreshToken(refreshToken, (err, user) => {
      if (err) return res.status(403).json({ error: 'Token inválido' });

      const newTokens = generateTokens({ id: user.id, role: user.role });
      return res.json(newTokens);
    });
  } catch (error) {
    console.error('Error en refreshToken:', error);
    return res.status(500).json({ error: 'Error interno del servidor' });
  }
};

module.exports = {
  login,
  refreshToken,
};

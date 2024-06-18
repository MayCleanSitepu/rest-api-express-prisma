
const jwt = require('jsonwebtoken');


function notFound(req, res, next) {
  res.status(404);
  const error = new Error(`🔍 - Not Found - ${req.originalUrl}`);
  next(error);
}

/* eslint-disable no-unused-vars */
function errorHandler(err, req, res, next) {
  /* eslint-enable no-unused-vars */
  const statusCode = res.statusCode !== 200 ? res.statusCode : 500;
  res.status(statusCode);
  res.json({
    message: err.message,
    stack: process.env.NODE_ENV === 'production' ? '🥞' : err.stack
  });
}

function checkRole(requiredRole) {
  return (req, res, next) => {
    if (req.user.role !== requiredRole) {
      return res.status(403).json({ message: 'Forbidden' });
    }
    next();
  };
}

function isAuthenticated(req, res, next) {
  const authorizationHeader = req.headers.authorization;

  if (!authorizationHeader) {
    return res.status(401).json({ message: '🚫 Un-Authorized 🚫' });
  }

  try {
    const token = authorizationHeader.split(' ')[1];
    const payload = jwt.verify(token, process.env.JWT_ACCESS_SECRET);
    req.payload = payload;
    next();
  } catch (err) {
    res.status(401).json({ message: '🚫 Un-Authorized 🚫' });
  }
}

module.exports = {
  notFound,
  errorHandler,
  isAuthenticated,
  checkRole,
};

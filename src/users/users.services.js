const bcrypt = require('bcrypt');
const prisma = require('../db');

function findUserByEmail(email) {
  return prisma.user.findUnique({
    where: {
      email,
    },
  });
}

async function createUserByEmailAndPassword({ email, password, role = 'user' }) {
  const hashedPassword = await bcrypt.hash(password, 10);
  return prisma.user.create({
    data: {
      email,
      password: hashedPassword,
      role
    }
  });
}


function findUserById(id) {
  return prisma.user.findUnique({
    where: {
      id,
    },
  });
}

module.exports = {
  findUserByEmail,
  findUserById,
  createUserByEmailAndPassword
};
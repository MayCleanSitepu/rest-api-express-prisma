const jwt = require('jsonwebtoken');

const generateAccessToken = (user) => {
    return jwt.sign(
        { userId: user.id}, 
        process.env.JWT_ACCESS_SECRET, 
        { expiresIn: '15m' }
    );
};

const generateRefreshToken = (user) =>{
    return jwt.sign(
        { userId: user.id},
        process.env.JWT_REFRESH_SECRET,
        { expiresIn: '8h'}
    );
}

const generateTokens = (user) =>{
    const accessToken = generateAccessToken(user);
    const refreshToken = generateRefreshToken(user);

    return{
        accessToken,
        refreshToken,
    };
}

module.exports ={
    generateAccessToken,
    generateRefreshToken,
    generateTokens,
}

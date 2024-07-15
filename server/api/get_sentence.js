const axios = require('axios');

const getSentence = async()=>{
  const jokeData = await axios.get('https://api.quotable.io/random?minLength=200');
  return  jokeData.data.content.split(' ');
}

module.exports = getSentence();
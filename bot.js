const Discord = require('discord.js');
const auth = require('./auth');

const client = new Discord.Client();

client.on('ready', () => {
    console.log(`Logged in as ${client.user.tag}`);
});

console.log('using auth token', auth.AUTH_TOKEN);
client.login(auth.AUTH_TOKEN);

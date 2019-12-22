const Discord = require('discord.js');
const auth = require('./auth');
const curseWords = require('./curse-words');

const client = new Discord.Client();

client.on('ready', () => {
    console.log(`Logged in as ${client.user.tag}`);
});

client.on('message', msg => {
    if (msg.content.indexOf(('watch your language')) === -1) {
        const findCurseWords = curseWords.map(word => {
            const message = msg.content.toLowerCase();
            const curseWord = word.toLowerCase();
            const regex = new RegExp(`${curseWord}$`, 'g', )
            const match = message.match(regex);

            return !!(match);
        });

        const hasCurseWords = findCurseWords.filter(index => index === true).length;

        if (hasCurseWords) {
            msg.reply('watch your language.');
        }
    }
});

client.login(auth.AUTH_TOKEN);

const config = require('./env-config');

const authToken = config['AUTH_TOKEN'] ? config['AUTH_TOKEN'] : '';

const auth = {
    "AUTH_TOKEN": authToken
};

module.exports = {
    ...auth
};

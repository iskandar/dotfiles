

# Intall nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

# Get yarn installed, we'll use that for our global installs
npm install -g yarn

# http://yeoman.io/
yarn global add yo

# https://www.npmjs.com/package/npx
yarn global add npx

# https://github.com/remy/nodemon
yarn global add nodemon

# https://localtunnel.github.io/www/
yarn global add localtunnel

# https://www.getpostman.com/docs/v6/postman/collection_runs/command_line_integration_with_newman
yarn global add newman

# Items like gulp, webpack should be installed locally as part of an application's node_modules

#!/bin/bash
echo 'Project setup staring...'
echo 'Enter app name:'
read name
mkdir $name
cd $name
echo 'Installing packages. Hold tight, this could take a moment.'
npm init -y
mkdir src
echo 'Installing react, react-dom, and react-scripts...'
npm i react react-dom -S
npm i webpack webpack-cli babel-core babel-loader@7.1.5 babel-preset-env babel-preset-react html-webpack-plugin webpack-dev-server -D
touch webpack.config.js
cat > webpack.config.js <<EOF
const HtmlWebPackPlugin = require("html-webpack-plugin")
const path = require('path')

const htmlPlugin = new HtmlWebPackPlugin({
  template: "./src/index.html",
  filename: "./index.html"
});

module.exports = {
  entry: "./src/app.js",
  output: {
    path: path.resolve('dist'),
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader"
        }
      }
    ]
  },
  plugins: [htmlPlugin]
}

EOF
touch README.md
cat > README.md <<EOF
 ## Replace sripts with package.json
 "scripts": {
    "start": "webpack-dev-server --mode development --open",
    "build": "webpack --mode production"
  }

EOF

touch .babelrc
cat > .babelrc <<EOF
{
  "presets": ["env", "react"]
}
EOF
touch src/index.html
cat > src/index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>React and Webpack4</title>
</head>
<body>
  <div id="app"></div>
</body>
</html>
EOF
touch src/app.js
cat > src/app.js << EOF
import React from "react"
import ReactDOM from "react-dom"

const App = () => {
  return <div>Hello React!</div>
};

ReactDOM.render(<App />, document.getElementById("app"))
EOF
echo 'Project created successfully'
cd ..
rm webpack-react.sh

# React-webpak-boilerplate
A React webpack application setup on with bashscript

## Create a react webpack app with bashscript(Automatic)
### Requirement:

```
1. Nodejs installed on syestem
2. NPM installed on syestem
```
### Run bashscript

```
git clone https://github.com/asb14690/react-webpak-boilerplate.git
./webpack-react.sh
```

### Replace package.json scripts to run your application from README.md

```
"scripts": {
   "start": "webpack-dev-server --mode development --open",
   "build": "webpack --mode production"
 }
```

### Move to app directory

```
cd appName
npm start // start in development mode
npm build // production mode

```

## Create a react webpack app (Manual)

Step 1: Make a project directory i.e name your application e.g react-webpack(Name should be in loawercase)

```
mkdir react-webpack
cd react-webpack
```

Step 2:  initialize npm in your app directory

```
npm init
```

or (If yoo want to skip all questions from npm user -y flag)

```
npm init -y
```

Step 3: We need to install webpack as a dev dependency and webpack-cli so that you can use webpack in the command line

```javascript
npm i webpack webpack-cli -D
```

i = install -D = --save-dev

Step 4: Create a src directory within your application folder with app.js and place a below code in the app.js

```
console.log('Hello from react')
```

setp 5 : Add/replace the following script into your package.json file

```
 "scripts": {
    "start": "webpack --mode development",
    "build": "webpack --mode production"
  }
```

## Setting Up React and Babel

To work with React, we need to install it along with Babel. This will transpile the code from ES6 to ES5, as not all browsers support ES6 yet (for example Internet Explorer).

Install react and react-dom as a dependency

```
npm i react react-dom -S
```

-S: --save

Then install babel-core, babel-loader, babel-preset-env and babel-preset-react as a dev dependency

```
npm i babel-core babel-loader babel-preset-env babel-preset-react -D
```

***use babel-loader based on dependency compatiblity with the babel core i.e babel-loader@7.x

###babel-core:

Transforms your ES6 code into ES5

###babel-loader: 

Webpack helper to transform your JavaScript dependencies (for example, when you import your components into other components) with Babel

###babel-preset-env: 

Determines which transformations/plugins to use and polyfills (provide modern functionality on older browsers that do not natively support it) based on the browser matrix you want to support

###babel-preset-react:

 Babel preset for all React plugins, for example turning JSX into functions

 We need to create a webpack.config.js file to state the rules for our babel-loader

 ```
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


 ```

 We then need to make a separate file called .babelrc to provide the options for babel-loader. You can include it in the webpack.config.js file, but I have seen that most projects have this separated. This results in clearer readability, and it can be used by other tools unrelated to webpack. When you state that you’re using babel-loader in your webpack config, it will look for .babelrc file if there is one.

 ```
 {
  "presets": ["env", "react"]
}
 ```

 Next, change your index.js file to render a component:

 ```
import React from "react";
import ReactDOM from "react-dom";

const App = () => {
  return <div>Hello React!</div>;
};

ReactDOM.render(<App />, document.getElementById("app"));
 ```

 We will also need to create an index.html file in the src folder where we can add our section element with id index. This is where we render our main react component:

 ```
 <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>React and Webpack4</title>
</head>
<body>
  <section id="app"></section>
</body>
</html>
 ```

 Now we need to install html-webpack-plugin and use this in our webpack config file. This plugin generates an HTML file with script and injected, writes this to index.html, and minifies the file.

install html-webpack-plugin as a dev dependency:

 ```
 npm i html-webpack-plugin -D
 ```

If you now run npm run start you should see localhost:8080 open up in your default browser — that’s what the —-open flag is for. Now everytime you make changes, it will refresh the page.

:)

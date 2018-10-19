# React-webpak-boilerplate
A React webpack application setup on with bashscript

## Create a react webpack app with bashscript(Automatic)
### Requirement:
`
1. Nodejs installed on syestem
2. NPM installed on syestem
`
### Run bashscript
`
git clone https://github.com/asb14690/react-webpak-boilerplate.git
./webpack-react.sh
`
### Replace package.json scripts to run your application from README.md

`
"scripts": {
   "start": "webpack-dev-server --mode development --open",
   "build": "webpack --mode production"
 }
`
### Move to app directory

`
cd appName
npm start // start in development mode
npm build // production mode

`

## Create a react webpack app (Manual)

Step 1: Make a project directory i.e name your application e.g react-webpack(Name should be in loawercase)
`
mkdir react-webpack
cd react-webpack
`
Step 2:  initialize npm in your app directory
`
npm init
`

or (If yoo want to skip all questions from npm user -y flag)
`

npm init -y
`

Step 3: We need to install webpack as a dev dependency and webpack-cli so that you can use webpack in the command line

`
npm i webpack webpack-cli -D
`

i = install -D = --save-dev

Step 4: Create a src directory within your application folder with app.js and place a below code in the app.js

`
console.log('Hello from react')
`

setp 5 : Add/replace the following script into your package.json file
`
 "scripts": {
    "start": "webpack --mode development",
    "build": "webpack --mode production"
  }
`

## Setting Up React and Babel


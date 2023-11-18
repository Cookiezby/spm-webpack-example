const path = require('path');

module.exports = {
  entry: './main.ts',
  module: {
    rules: [
      {
        test: /\.ts?$/,
        use: 'ts-loader',
        exclude: /node_modules/,
      },
    ],
  },
  resolve: {
    extensions: ['.ts'],
  },
  output: {
    filename: 'main.js',
    path: path.resolve(__dirname, './Sources/JSBridge/TypeScript'),
    library: 'WebBridge',
    libraryTarget: 'commonjs2'
  },
};

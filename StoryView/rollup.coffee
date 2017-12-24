import {
  coffee2
  coffeepath
} from 'cfx.rollup-plugin-coffee2'
import cleanup from 'rollup-plugin-cleanup'

export default
  input: './index.js'
  output:
    file: './dist/bundle.js'
    format: 'cjs'

  plugins: [
    coffee2
      bare: true
      sourceMap: true
    coffeepath()
    cleanup()
  ]

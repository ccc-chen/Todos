import alias from 'rollup-plugin-alias'
import dd from 'ddeyes'
import {
  coffee2
  coffeepath
} from 'cfx.rollup-plugin-coffee2'
import cleanup from 'rollup-plugin-cleanup'
import image from 'rollup-plugin-image'
import replace from 'rollup-plugin-re'

export default
  input: './index.js'
  output:
    file: './dist/bundle.js'
    format: 'cjs'

  plugins: [
    
    alias
      resolve: [
        '.coffee'
        '.js'
      ]
      src: './sources/index'
    
    replace
      patterns: [
        transform: (code, id) ->
          pattern = /\.\.\/\.\.\/\.\.\/public\/assets\/demo-1-bg\.jpg/
          if pattern.test code
            code = code.replace pattern, '../../assets/demo-1-bg.jpg'
            dd code
          code
      ]
    replace
      patterns: [
        transform: (code, id) ->
          pattern = /\.\.\/\.\.\/\.\.\/public\/assets\/login_ico\.png/
          if pattern.test code
            code = code.replace pattern, '../../assets/login_ico.png'
            dd code
          code
      ]
    coffee2
      bare: true
      sourceMap: true
    coffeepath()
    image()
    cleanup()

  ]

const mix = require('laravel-mix');

mix.setPublicPath('src/main/webapp/resources/static/');
mix.js('src/main/webapp/resources/JS/vue/main.js', 'js')
    .extract(['vue']);
// mix.sass('src/main/resources/assets/resources/sass/app.scss', 'css');
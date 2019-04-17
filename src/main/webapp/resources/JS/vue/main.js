import Vue from 'vue'



Vue.component('search-component' , require('./src/components/SearchBook').default);

const app =new Vue({
  el: '#app'

})
alert( "hello" );

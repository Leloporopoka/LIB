import Vue from 'vue'
import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(VueAxios, axios)


Vue.prototype.$axios = axios
Vue.component('search-component' , require('./src/components/SearchBook').default);
Vue.component('search-load' , require('./src/components/SearchLoadComponent').default);
const app =new Vue({
    el: '#app',
})


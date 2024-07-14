import Vue from 'vue';
import routes from './router/index'
require('./bootstrap');

Vue.prototype.$api_url = "https://amarbangabandhu.app/";

Vue.component('navbar-component', require('./components/NavbarComponent.vue').default);
Vue.component('home-nav', require('./components/HomeNav').default);
Vue.component('home-footer', require('./components/footer').default);
Vue.component('player-nav', require('./pages/players/Nav').default);
Vue.component('player-footer', require('./pages/players/footer').default);
Vue.component('head-details', require('./pages/players/headDetails').default);
Vue.component('ad-footer', require('./pages/admin/adFooter').default);
Vue.component('ad-header', require('./pages/admin/mainHeader').default);
Vue.component('ad-sidebar', require('./pages/admin/mainSidebar').default);
Vue.component('admin-auth', require('./pages/admin/auth').default);


const app = new Vue({
    el: '#app',
    router:routes
});

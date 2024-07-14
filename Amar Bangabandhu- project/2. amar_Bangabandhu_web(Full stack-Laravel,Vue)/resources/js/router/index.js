import Vue from 'vue'
import VueRouter from 'vue-router'
import Notfound from '../components/NotFound'
import Test from '../pages/test'
import Home from '../pages/home.vue'
import Scoreboard from '../pages/scoreboard.vue'
import Prizes from '../pages/prize.vue'
import Notices from '../pages/notice.vue'
import Ranking from '../pages/ranking'
import About from '../pages/about'
import Term from '../pages/terms'
import Rule from '../pages/rules'
import Faq from '../pages/faq'
import Contact from '../pages/contact'
import Developer from '../pages/developers'
import Login from '../pages/login'
//player dash
import PrDash from '../pages/players/dashboard'
import Setting from '../pages/players/setting'
import PrRank from '../pages/players/prRanking'
//admin dash
import AdminDash from '../pages/admin/dashboard'
import AdPerformance from '../pages/admin/performance'
import topTen from '../pages/admin/topTen'
import GenWise from '../pages/admin/genderWise'
import GrpWise from '../pages/admin/groupWise'
import PrnWise from '../pages/admin/parentsWise'
import PrPf from '../pages/admin/viewProfile'
import Auth from '../pages/admin/auth'

//Pin Reset
import PinReset from '../pages/pinReset'


Vue.use(VueRouter);

const routes=new VueRouter({
    mode:'history',
    routes:[

        {
        path: '*',
        component:Notfound,
        },

        {
        path: '/',
        component:Home,
        name: 'home'
        },
        {
        path: '/scoreboard',
        component:Scoreboard,
        name: 'score-board'
        },
        {
        path: '/prizes',
        component:Prizes,
        name: 'prize'
        },
        {
        path: '/notices',
        component:Notices,
        name: 'notice'
        },
        {
        path: '/test',
        component:Test,
        name: 'test'
        },
        {
        path: '/ranking',
        component:Ranking,
        name: 'ranking'
        },
        {
        path: '/about',
        component:About,
        name: 'about'
        },
        {
        path: '/rules',
        component:Rule,
        name: 'rules'
        },
        {
        path: '/terms-policy',
        component:Term,
        name: 'terms'
        },
        {
        path: '/faq',
        component:Faq,
        name: 'faq'
        },
        {
        path: '/contact',
        component:Contact,
        name: 'contact'
        },
        {
        path: '/dev',
        component:Developer,
        name: 'dev'
        },
        {
        path: '/login',
        component:Login,
        name: 'login',
            meta: {
                prLogged: true
            }
        },
//Pin-reset

        {
            path: '/pin-reset',
            component:PinReset,
            name: 'pinReset'
        },




        //plyers route

        {
            path: '/player/dashboard',
            component:PrDash,
            name: 'pr-dash',
            meta: {
                prLogin: true
            }
        },
        {
            path: '/player/setting',
            component:Setting,
            name: 'setting',
            meta: {
                prLogin: true
            }
        },
        {
            path: '/player/ranking',
            component:PrRank,
            name: 'pr-rank',
            meta: {
                prLogin: true
            }
        },

        //admin
        {
            path: '/admin/dashboard',
            component:AdminDash,
            name: 'ad-dash',
            meta: {
                requiresAuth: true
            }
        },
        {
            path: '/admin/topTen',
            component:topTen,
            name: 'topTen'
        },
        {
            path: '/admin/performance',
            component:AdPerformance,
            name: 'ad-performance'
        },
        {
            path: '/admin/gen-wise',
            component:GenWise,
            name: 'gen-wise'
        },
        {
            path: '/admin/group-wise',
            component:GrpWise,
            name: 'grp-wise'
        },
        {
            path: '/admin/view/:prid?',
            component:PrPf,
            name: 'view-pp'
        },
        {
            path: '/admin/pfn-wise',
            component:PrnWise,
            name: 'pfn-wise'
        },
        {
            path: '/admin-login',
            component:Auth,
            name: 'auth',
            meta: {
                loginCheck: true
            }
        },

    ],
    linkActiveClass: "active"

});
routes.beforeEach((to, from, next) => {
    let api="https://amarbangabandhu.app/";


    if (to.matched.some(record => record.meta.requiresAuth)) {

        if (localStorage.getItem('Modlog')==='modlog') {
            axios.get(api+'api/v1/modLogged').then(response =>next()).catch((error) => {
                window.location.href = '/admin-login';
            });
        } else {
            window.location.href = '/admin-login';
        }
    } else {
        next() // does not require auth, make sure to always call next()!
    }

    if (to.matched.some(record => record.meta.loginCheck)) {

        if (localStorage.getItem('Modlog')==='modlog') {

            axios.get(api+'api/v1/modLogged').then(
                response =>window.location.href = '/admin/dashboard').catch((error) =>  next());

        } else {
            next()
        }
    } else {
        next() // does not require auth, make sure to always call next()!
    }



    if (to.matched.some(record => record.meta.prLogin)) {

        if (localStorage.getItem('PrLog')==='prLog') {

            axios.get(api+'api/v1/playerLogged').then(response =>next()).catch((error) => {
                window.location.href = '/login';
            });

        } else {
            window.location.href = '/login';
        }
    } else {
        next() // does not require auth, make sure to always call next()!
    }




    if (to.matched.some(record => record.meta.prLogged)) {

        if (localStorage.getItem('PrLog')==='prLog') {

            axios.get(api+'api/v1/playerLogged').then(
                response =>window.location.href = '/player/dashboard').catch((error) =>  next());

        } else {
            next()
        }
    } else {
        next() // does not require auth, make sure to always call next()!
    }


});
export default routes;

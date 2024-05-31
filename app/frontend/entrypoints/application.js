import $ from 'jquery';
window.$ = $;
// import 'bootstrap/js/src/alert'
// import 'bootstrap/js/src/button'
// import 'bootstrap/js/src/carousel'
import 'bootstrap/js/src/collapse'
import 'bootstrap/js/src/dropdown'
// import 'bootstrap/js/src/modal'
// import 'bootstrap/js/src/popover'
import 'bootstrap/js/src/scrollspy'
// import 'bootstrap/js/src/tab'
// import 'bootstrap/js/src/toast'
// import 'bootstrap/js/src/tooltip'
import { createApp } from 'vue';
import router from '../router';

// Import App Component
import App from '../components/App.vue';

import * as bootstrap from 'bootstrap';
window.bootstrap = bootstrap;

// initialize the page
window.addEventListener('load', () => {
    initPage();
})

function initPage() {
    // initialize popovers
    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
        return new bootstrap.Popover(popoverTriggerEl);
    });
}

// Create Vue App with Router
createApp(App).use(router).mount('#app');

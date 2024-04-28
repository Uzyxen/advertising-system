export default defineNuxtRouteMiddleware((to, from) => {
    if(CheckIfLogged()) {
        return navigateTo('/logowanie');
    }

})
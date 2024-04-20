export default defineNuxtRouteMiddleware((to, from) => {
    if(IsUserLogged() === false) {
        return navigateTo('/logowanie');
    }
});
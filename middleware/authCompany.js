export default defineNuxtRouteMiddleware((to, from) => {
    if(IsCompanyLogged() === false) {
        return navigateTo('/firma/logowanie');
    }
});
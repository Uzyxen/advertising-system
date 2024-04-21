export default defineNuxtRouteMiddleware((to, from) => {
    if(IsUserLogged()) {
        return navigateTo('/profil');
    }
});
export default defineNuxtRouteMiddleware((to, from) => {
    checkSession();
    
    return;
})
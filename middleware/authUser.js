export default defineNuxtRouteMiddleware(async (to, from) => {
    const isUserLogged = await IsUserLogged();

    if(isUserLogged === false) {
        return navigateTo('/logowanie');
    }
})
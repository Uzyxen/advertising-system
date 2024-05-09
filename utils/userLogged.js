export async function IsUserLogged() {
    const response = await $fetch('http://localhost/advertising-system/backend/api/user/CheckIfLogged.php', { credentials: 'include', responseType: 'json' });

    if(response) {
        return response.logged;
    }
}
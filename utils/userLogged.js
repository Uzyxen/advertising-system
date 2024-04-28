export async function CheckIfLogged() {
    const response = await $fetch('http://localhost/advertising-system/backend/api/user/CheckIfLogged.php', { credentials: 'include', responseType: 'json' });

    if(response == 'logged') {
        return true;
    }

    return false;
}
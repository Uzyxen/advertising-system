export async function checkSession() {
    const response = await $fetch('http://localhost/advertising-system/backend/api/CheckSession.php', { credentials: 'include', responseType: 'json' });
}
export async function checkSession() {
    const headers = useRequestHeaders(['cookie'])
    const { data: response } = await $fetch('http://localhost/advertising-system/backend/api/CheckSession.php', { headers, credentials: 'include', responseType: 'json' });
}